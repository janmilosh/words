require_relative '../app/game'

puts 'Word length (5, 6, 7, or 8)?'
l = gets.chomp.to_i
g = Game.new(l)
g.run
puts
puts "The correct word was #{ g.solution }."