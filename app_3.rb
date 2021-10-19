require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "     -------------------------------------------------"
puts "     |Bienvenue sur 'CLASH OF POO' !                 |"
puts "     |Le but du jeu est d'être le dernier survivant !|"
puts "     -------------------------------------------------"


# Initialisation du joueur :
puts "Salutation Humain quel est ton nom"
puts "Entrez votre nom"
human_name = gets.chomp
user = HumanPlayer.new(human_name)

my_game = Game.new(user)

while my_game.is_still_ongoing? == true do
    my_game.show_players
    my_game.menu
    action = gets.chomp.to_s
    puts ""
    my_game.menu_choice(action)
    my_game.enemies_attack
end
my_game.end
