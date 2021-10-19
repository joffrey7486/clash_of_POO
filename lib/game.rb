class Game
    attr_accessor :human_player, :enemies

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        player1 = Player.new("player1")
        player2 = Player.new("player2")
        player3 = Player.new("player3")
        player4 = Player.new("player4")
        @enemies = []
        @enemies += [player1,player2,player3,player4]
    end    


    def is_still_ongoing?
        while @human_player.life_points > 0 || enemies == []
            menu
            menu_choice(@human_player,enemies)
            enemies_attack(@human_player, enemies)
            show_players
        end
            end_game(@human_player)
    end

    def show_players
        puts "Tu as #{human_player.life_points}"
        puts "il reste #{@enemies.length} bots, courage!!"
    end

    def menu
      puts ""
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner "
      puts "attaquer un joueur en vie :"    
      @enemies.each do |enemy| 
      puts "#{0} - #{enemy.name} a 10 points de vie"
      end
    end
    
    def menu_choice(human_player,enemies)
        good_choice = true
        while good_choice == true    
          choice = gets.chomp 
          case choice
              when "a" then human_player.search_weapon
                good_choice = false
              when "s" then human_player.search_health_pack
                good_choice = false
              when "0" then human_player.attacks(enemies[0])
                good_choice = false
              when "1" then human_player.attacks(enemies[1])
                good_choice = false
              when "2" then human_player.attacks(enemies[2])
              good_choice = false
              when "3" then human_player.attacks(enemies[3])
              good_choice = false
          else
              good_choice = true
              puts "Tu n'as pas appeler la bonne fonction"
          end
        end
    end
    
    
    def enemies_attack(human_player, enemies)
        enemies.each do |playerX|
            if playerX.life_points > 0 
                playerX.attacks(human_player.name)
            else 
                kill_player(playerX)
            end
        end
    end
    
    
    def end_game(human_player)
      puts "La partie est finie" 
      if human_player.life_points > 0
          puts  "BRAVO ! TU AS GAGNE !"
      else 
          puts "Loser ! Tu as perdu !"
      end
    end

    def kill_player(playerX)
        @enemies.delete(playerX)    
    end
    

end
