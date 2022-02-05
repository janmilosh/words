require_relative '../app/game'

puts 'Word length (5, 6, 7, or 8)?'
length = gets.chomp.to_i
lengths = [5, 6, 7, 8]
if lengths.include?(length)
  g = Game.new(length)
  g.run
  puts
  puts "The correct word was #{ g.solution }."
else
  puts "That isn't a supported word length, please run again."
end
