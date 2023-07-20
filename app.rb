require 'pry'

class BoardCase
  attr_accessor :id_case, :value
  
  def initialize(string)
    @id_case = string
    @value = 'vide'
  end
  
end

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :array_9_cases
  
  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor 
    #de la classe
    array_9_cases = []
    array_9_cases << BoardCase.new("A1")
    array_9_cases << BoardCase.new("A2")
    array_9_cases << BoardCase.new("A3")
    array_9_cases << BoardCase.new("B1")
    array_9_cases << BoardCase.new("B2")
    array_9_cases << BoardCase.new("B3")
    array_9_cases << BoardCase.new("C1")
    array_9_cases << BoardCase.new("C2")
    array_9_cases << BoardCase.new("C3")
  end
  
  def case_empty?(index)
    array_9_cases[index-1].value == 'vide'
  end
  
  def play_turn(player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    
    print "Saisir le choix d'une case libre [1..9] >"
    choice_case = get.chomp
    if choice_case == '1' && case_empty?(0)
      array_9_cases[0].value = player.player_id
    elsif 
      choice_case == '2' && case_empty?(1)
      array_9_cases[1].value = player.player_id
    elsif
      choice_case == '3' && case_empty?(2)
      array_9_cases[2].value = player.player_id
      
    else
      puts "saisie interdite/case pas libre"
    end
  end
  
  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique 
    #s'il y a un vainqueur ou match nul
    
  end
  
  def board_print
    print @@mon_board.array_9_cases[0].value
    print ' ' *2
    print array_9_cases[1].value
    print ' ' *2
    puts array_9_cases[2].value
    
    print array_9_cases[3].value
    print ' ' *2
    print array_9_cases[4].value
    print ' ' *2
    puts array_9_cases[5].value
    
    print array_9_cases[6].value
    print ' ' *2
    print array_9_cases[7].value
    print ' ' *2
    puts array_9_cases[8].value
  end
  
end

class Player
  
  attr_reader :name, :player_id
  
  def initialize(player_name, player_category)
    #TO DO : doit régler son nom et sa valeur
    @name = player_name
    @player_id = player_category # le X ou le O
  end
  
end

class Game
  #TO DO : la classe a plusieurs attr_accessor: 
  #le current_player (égal à un objet Player), 
  #le status (en cours, nul ou un objet Player s'il gagne), 
  #le Board et un array contenant les 2 joueurs.
  attr_accessor :player1, :player2, :current_player, :status
  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", 
    #défini un current_player
    @player1 = Player.new('Josiane', 'X')
    @player2 = Player.new('José', 'O')
    @current_player = @player1
    @status = "on going"
    @@mon_board = Board.new
  end
  
  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes 
    #(notamment à l'instance de Board). 
    #Elle affiche le plateau, demande au joueur ce qu'il joue, 
    #vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    @@mon_board.board_print
    
    play_turn(player1)
    @@mon_board.board_print
  end
  
  def new_round
    # TO DO : relance une partie en initialisant un nouveau board 
    #mais en gardant les mêmes joueurs.
  end
  
  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté 
    #ou si il y a match nul
  end    
  
end


class Show
  
  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. 
    #S'active avec un Show.new.show_board(instance_de_Board)
  end
  
end

class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while 
    #pour faire tourner le jeu tant que la partie n'est pas terminée.
    
    mon_game = Game.new
    #binding.pry
    mon_game.turn
    
  end
  
end


Application.new.perform