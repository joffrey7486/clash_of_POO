
class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    # Retourne le nom et le nombre de pooint de vie
    def show_state
        puts "#{name} a #{life_points} points de vie !!"
    end

    def gets_damage(damage) #damage_received est un entier qu'on met en entrée de la méthode
        #On soustrait l'entier en entrée au niveau de vie de l'objet sur lequel la méthode est appliquée :
        @life_points = @life_points - damage
        
        #Si le niveau de vie de l'objet est inférieur ou égal à zéro, le joueur est tué et on affiche un message.
        if @life_points <= 0
        puts "le joueur #{@name} a été tué !" # l'écriture #{} permet d'insérer une variable dans un string
        puts "     (×_×#)   "
        end
    end


    # Retourne les damages d'un joueur à un autre 
    def attacks(other_player)
        puts "Le joueur #{name} attaque le joueur #{other_player.name}"
        damage = compute_damage
        puts "Il lui inflige #{damage} points de dommages"
        other_player.gets_damage(damage)
    end

    # définit aléatoirement le nombre entre 1 et 6 de damages 
    def compute_damage
        return rand(1..6) # retour un nombre aléatoire pour les dommages causés
    end


    # effectue la méthode sho_state pour les deux joueurs
    def self.players_state(player1,player2)
      puts ""
      puts "Voici l'état de chaque joueur :"
      print player1.show_state
      print player2.show_state
      puts ""
    end
end


class HumanPlayer < Player
    attr_accessor :name, :life_points, :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 3
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
    rand(1..6) * @weapon_level
    end

    # retourne une arme avec un niveau égal a un nombre, si le nombre est supérieur a celui délà présent, met à jour la nouvelle arme
    def search_weapon
      new_weapon_level = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
      if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    end

    # retourne ou non un pack de santé équal a un nombre qui s'ajoute à la vie du joueur, la vie du joueur ne peux pas dépasser 100 points de vie 
    def search_health_pack
        dice_throw = rand(1..6)
        if dice_throw == 1
            puts "Tu n'as rien trouvé... "
        elsif dice_throw > 1 && dice_throw >= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points += 50
            if @life_points > 100
                @life_points = 100
            end
        else dice_throw == 6
            puts  "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
            if @life_points > 100
                @life_points = 100
            end
        end
    end
end
