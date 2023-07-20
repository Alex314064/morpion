require 'pry'

class BoardCase
  attr_accessor :id_case, :value, :occupied_by
  
  def initialize(string)
    @id_case = string
    @value = 0
    @occupied_by = ""
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
    @array_9_cases = []
    @array_9_cases << BoardCase.new("A1")
    @array_9_cases << BoardCase.new("A2")
    @array_9_cases << BoardCase.new("A3")
    @array_9_cases << BoardCase.new("B1")
    @array_9_cases << BoardCase.new("B2")
    @array_9_cases << BoardCase.new("B3")
    @array_9_cases << BoardCase.new("C1")
    @array_9_cases << BoardCase.new("C2")
    @array_9_cases << BoardCase.new("C3")
    
  end
  
  def case_empty?(index)
    array_9_cases[index-1].occupied_by == 'vide'
  end
  
  def play_turn(player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    
    print "Saisir le choix d'une case libre [1..9] >"
    choice_case = gets.chomp
    if choice_case == '1' && case_empty?(0)
      @array_9_cases[0].occupied_by = player.player_id
    elsif 
      choice_case == '2' && case_empty?(1)
      @array_9_cases[1].occupied_by = player.player_id
    elsif
      choice_case == '3' && case_empty?(2)
      @array_9_cases[2].occupied_by = player.player_id
    elsif
      choice_case == '4' && case_empty?(3)
      @array_9_cases[3].occupied_by = player.player_id
    elsif
      choice_case == '5' && case_empty?(4)
      @array_9_cases[4].occupied_by = player.player_id
    elsif
      choice_case == '6' && case_empty?(5)
      @array_9_cases[5].occupied_by = player.player_id
    elsif
      choice_case == '7' && case_empty?(6)
      @array_9_cases[6].occupied_by = player.player_id
    elsif
      choice_case == '8' && case_empty?(7)
      @array_9_cases[7].occupied_by = player.player_id
    elsif
      choice_case == '9' && case_empty?(8)
      @array_9_cases[8].occupied_by = player.player_id      
    else
      puts "saisie interdite/case pas libre"
      play_turn(player)
    end
  end
  
  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique 
    #s'il y a un vainqueur ou match nul
    sum_first_line = @array_9_cases[0].value + @array_9_cases[1].value + @array_9_cases[2].value
    sum_second_line =  @array_9_cases[3].value + @array_9_cases[4].value + @array_9_cases[5].value
    sum_third_line =  @array_9_cases[6].value + @array_9_cases[7].value + @array_9_cases[8].value
    sum_first_colo =  @array_9_cases[0].value + @array_9_cases[3].value + @array_9_cases[6].value
    sum_second_colo =  @array_9_cases[1].value + @array_9_cases[4].value + @array_9_cases[7].value
    sum_third_colo =  @array_9_cases[2].value + @array_9_cases[5].value + @array_9_cases[8].value
    sum_first_diagonal =  @array_9_cases[0].value + @array_9_cases[4].value + @array_9_cases[8].value
    sum_second_diagonal =  @array_9_cases[2].value + @array_9_cases[4].value + @array_9_cases[6].value
    
    if sum_first_line == 3 || sum_second_line ==3 || sum_third_line ==3
      puts "la partie est finie, le joueur gagant est le #{@player1}"
      return true
    end
    
    if sum_first_colo == 3 || sum_second_colo ==3 || sum_third_colo ==3
      puts "la partie est finie, le joueur gagant est le #{@player1}"
      return true
    end
    
    if sum_first_diagonal == 3 || sum_second_diagonal == 3 
      puts "la partie est finie, le joueur gagant est le #{@player1}"
      return true
    end
    
    
    
    if sum_first_line == 6 || sum_second_line ==6 || sum_third_line ==6
      puts "la partie est finie, le joueur gagant est le #{@player2}"
      return true
    end
    
    if sum_first_colo == 6 || sum_second_colo ==6 || sum_third_colo ==6
      puts "la partie est finie, le joueur gagant est le #{@player2}"
      return true
    end
    
    if sum_first_diagonal == 6 || sum_second_diagonal == 6 
      puts "la partie est finie, le joueur gagant est le #{@player2}"
      return true
    end
    return false
  end
  
  def board_print # Affiche le plateau de jeu
    print @array_9_cases[0].occupied_by
    print ' ' *2
    print @array_9_cases[1].occupied_by
    print ' ' *2
    puts @array_9_cases[2].occupied_by
    
    print @array_9_cases[3].occupied_by
    print ' ' *2
    print @array_9_cases[4].occupied_by
    print ' ' *2
    puts @array_9_cases[5].occupied_by
    
    print @array_9_cases[6].occupied_by
    print ' ' *2
    print @array_9_cases[7].occupied_by
    print ' ' *2
    puts @array_9_cases[8].occupied_by
  end
  
end

class Player
  
  attr_reader :name, :player_id, :value # value = 1 (player1) && value = 2 (player2)
  
  def initialize(player_name, player_category, value)
    #TO DO : doit régler son nom et sa valeur
    @name = player_name
    @player_id = player_category 
    @value = 0# le X ou le O
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
    @player1 = Player.new('Josiane', 'X', 1)
    @player2 = Player.new('José', 'O', 2)
    @current_player = @player1
    @status = "on going"
    @@mon_board = Board.new
    @@mon_game = Game.new
   
  end
  
  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes 
    #(notamment à l'instance de Board). 
    #Elle affiche le plateau, demande au joueur ce qu'il joue, 
    #vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    @@mon_board.board_print
    while !@@mon_board.victory? do 
      @@mon_board.play_turn(@@mon_game.current_player)
      @@mon_board.board_print
      if @@mon_game.current_player == @player1
        @current_player == @player2
      else
        @current_player == @player1
      end
    end
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
    
    # @@mon_game = Game.new
    # #binding.pry
     @@mon_game.turn
    
  end
  
end


Application.new.perform