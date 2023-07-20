require_relative 'board_case'

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
    #@mon_board = 0
  end
  
  def case_empty?(name)
    array_9_cases.find {|board_case| board_case.id_case == name}.occupied_by=='⬜'
  end
  
  def play_turn(player)  
    board_print
    puts
    print "Saisir le choix d'une case libre [1..9] >"
    choice = gets.chomp
		
    if choice == '1' && case_empty?('A1')
      @array_9_cases[0].occupied_by = player.player_id
			@array_9_cases[0].value = player.value
    elsif choice == '2' && case_empty?('A2')
      @array_9_cases[1].occupied_by = player.player_id
			@array_9_cases[1].value = player.value
    elsif choice == '3' && case_empty?('A3')
      @array_9_cases[2].occupied_by = player.player_id
			@array_9_cases[2].value = player.value
		elsif choice == '4' && case_empty?('B1')
      @array_9_cases[3].occupied_by = player.player_id
			@array_9_cases[3].value = player.value
    elsif choice == '5' && case_empty?('B2')
      @array_9_cases[4].occupied_by = player.player_id
			@array_9_cases[4].value = player.value
    elsif choice == '6' && case_empty?('B3')
      @array_9_cases[5].occupied_by = player.player_id
			@array_9_cases[5].value = player.value
    elsif choice == '7' && case_empty?('C1')
      @array_9_cases[6].occupied_by = player.player_id
			@array_9_cases[6].value = player.value
    elsif choice == '8' && case_empty?('C2')
      @array_9_cases[7].occupied_by = player.player_id
			@array_9_cases[7].value = player.value
    elsif choice == '9' && case_empty?('C3')
      @array_9_cases[8].occupied_by = player.player_id      
			@array_9_cases[8].value = player.value
    else
      puts
			puts "⛔ saisie interdite/case pas libre ⛔"
      puts
      play_turn(player)
    end
  end

	def win_condition 
		sum_first_line  = @array_9_cases[0].value + @array_9_cases[1].value + @array_9_cases[2].value
    sum_second_line = @array_9_cases[3].value + @array_9_cases[4].value + @array_9_cases[5].value
    sum_third_line  = @array_9_cases[6].value + @array_9_cases[7].value + @array_9_cases[8].value
    sum_first_colo  = @array_9_cases[0].value + @array_9_cases[3].value + @array_9_cases[6].value
    sum_second_colo = @array_9_cases[1].value + @array_9_cases[4].value + @array_9_cases[7].value
    sum_third_colo =  @array_9_cases[2].value + @array_9_cases[5].value + @array_9_cases[8].value
    sum_first_diagonal  =  @array_9_cases[0].value + @array_9_cases[4].value + @array_9_cases[8].value
    sum_second_diagonal =  @array_9_cases[2].value + @array_9_cases[4].value + @array_9_cases[6].value
    
		return  [sum_first_line,sum_second_line,sum_third_line,sum_first_colo,sum_second_colo,sum_third_colo,sum_first_diagonal,sum_second_diagonal]
	
	end

	def victory?
    #TO DO : une méthode qui vérifie le plateau et indique 
    #s'il y a un vainqueur ou match nul
		# binding.pry
		#if win_condition.include?(3) || win_condition.include?(6)
		if (win_condition & [3,300]).any?
      return true
		
    else
    return false
		end
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