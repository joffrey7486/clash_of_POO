require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1=Player.new("Player1")
player2=Player.new("Player2")
player3=HumanPlayer.new("Player3")

puts player3.show_state
puts player2.attacks(player3)
puts player3.search_weapon
puts player3.search_health_pack
puts player3.attacks(player2)
puts player2.show_state
puts player2.attacks(player3)
puts player3.show_state
# Player.players_state(player1,player2)

# while player1.life_points>0 && player2.life_points>0
#   puts "Passons à la phase d'attaque :"
#   player2.attacks(player1)
#     if player1.life_points<=0 
#       Player.players_state(player1,player2)
#       break
#       else
#       player1.attacks(player2)
#     end
#   Player.players_state(player1,player2)
    
# end

binding.pry
