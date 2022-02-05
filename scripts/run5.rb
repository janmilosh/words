require_relative '../app/game'

g = Game.new(5)
g.run
puts
puts "The correct word was #{ g.solution }."
