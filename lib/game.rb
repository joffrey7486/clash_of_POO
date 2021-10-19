class Game
    attr_accessor :human_player, :enemies

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        @player1 = Player.new("player1")
        @player2 = Player.new("player2")
        @player3 = Player.new("player3")
        @player4 = Player.new("player4")
        @enemies = Array.new
        @enemies = [@player1,@player2,@player3,@player4]
    end    


    # Retire un player du tableau si il n'a plu de point de vie 
    def kill_player
        @enemies.each do |player|
        if (player.life_points <= 0)
            @enemies.delete(player)
            puts "#{player.name} vient d'être éliminé !"
            end
        end   
    end


    # Vérifie la santé de tout les joueurs et retourne false si le joueus human ou tout les autres n'ont plus de point de vie 
    def is_still_ongoing?
        if @human_player.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0 || @player3.life_points > 0 || @player4.life_points > 0)
            return true 
        else 
            return false 
        end         
    end

    # Retourne le nombre de point de vie du joueur ainsi que le nombre d'ennemis restant
    def show_players
        puts "Tu as #{human_player.life_points}"
        puts "il reste #{@enemies.length} bots, courage!!"
    end

    # Affiche le menu des décisions à prendre pour le joueurs 
    def menu
      puts ""
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner "
      puts "attaquer un joueur en vie :"   
      i = 0 
      @enemies.each do |enemy| 
      puts ">#{i += 1} pour #{enemy.name} a #{enemy.life_points} points de vie"
      end
    end
    
    def menu_choice(choice)
        if choice == "a"
            @human_player.search_weapon
        elsif choice == "s"
            @human_player.search_health_pack
        elsif choice == "1"
            @human_player.attacks(@player1)
        elsif choice == "2"
            @human_player.attacks(@player2)
        elsif choice == "3"
            @human_player.attacks(@player3)
        elsif choice == "4"
            @human_player.attacks(@player4)
        else
            puts "Tu as le choix entre a, s, 1, 2, 3 ou 4. Recommence !"
        end
        kill_player
    end
    

    # Utilise la fonction attacks pour chaque ennemis sur le joueur 
    def enemies_attack
        puts "Les ennemies vous attaquent"
        @enemies.each{|player| player.attacks(@human_player)}
    end
    

    # Affiche la fin de la partie ainsi la victoire ou la défaite du joueur
    def end
      puts "La partie est finie" 
      if human_player.life_points > 0
          puts  "BRAVO ! TU AS GAGNE !"
      else 
          puts "Loser ! Tu as perdu !"
      end
    end

end
