def welcome
  puts "Welcome to the wonderful world of Star Wars"

end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp.downcase
  return character
end
