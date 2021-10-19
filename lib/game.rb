class Game
    attr_accessor :human_player, :enemies

    def initialize(human_player, enemies)
        @human_player = HumanPlayer.new(human_name)
        player1 = Player.new("player1")
        player2 = Player.new("player2")
        player3 = Player.new("player3")
        player4 = Player.new("player4")
        @enemies += [player1,player2,player3,player4]
    end    

    def kill_player(Player)
      @enemies.delete(Player)    
    end

    def is_still_ongoing?
        is_true=true 
        if user.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
          is_true=true
        else
          is_true=false
        end
      return is_true
    end

    def show_players
        puts "#{@human_player.name} a #{human_player.life_points}"
        puts "il reste #{@enemies.length} bots, courage!!"
    end

    def menu
      puts ""
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner "
      puts "attaquer un joueur en vie :"    
      @enemies.each do |enemy| 
      puts "#{enemy.index} - #{enemy.name} a 10 points de vie"
      end
    end
    
    def menu_choice(user,enemies)
        good_choice = true
        while good_choice == true    
          choice = gets.chomp 
          case choice
              when "a" then user.search_weapon
                good_choice = false
              when "s" then user.search_health_pack
                good_choice = false
              when "0" then user.attacks(enemies[0])
                good_choice = false
              when "1" then user.attacks(enemies[1])
                good_choice = false
              when "2" then user.attacks(enemies[2])
              good_choice = false
              when "3" then user.attacks(enemies[3])
              good_choice = false
          else
              good_choice = true
              puts "Tu n'as pas appeler la bonne fonction"
          end
    end

    def user_action(user,enemies)  
       
       
    end
    
    def enemies_attack(user, enemies)
        enemies.each do |playerX|
            if playerX.life_points > 0 
                playerX.attacks(user)
            end
        end
    end
    
    
    def end(user)
      puts "La partie est finie" 
      if user.life_points > 0
          puts  "BRAVO ! TU AS GAGNE !"
      else 
          puts "Loser ! Tu as perdu !"
      end
    end
    
    
    def fight_phase(user, enemies)
        while 
            user_action(user, enemies)
            enemies_action(user, enemies)
        end
        game_end(user)
    end
    
end
