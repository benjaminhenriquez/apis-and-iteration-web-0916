require 'rest-client'
require 'JSON'
require 'pry'


def get_characters_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  return character_hash
end

def character_films(character)
  character_hash = get_characters_from_api(character)
  if current_character = character_hash["results"].find {|character_data| character_data["name"].downcase == character}
    current_films = current_character.fetch("films")
    return current_films
  else
    return nil
  end
end

def parse_character_movies(film_arr)
  if (film_arr == nil)
    puts "Character Doesn't Exist"
  else
    film_arr.map do |movie_url|
      all_movies = RestClient.get(movie_url)
      movie_hash = JSON.parse(all_movies)
      puts movie_hash["title"]
    end
  end
end

def show_character_movies(character)
  films_arr = character_films(character)
  parse_character_movies(films_arr)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
