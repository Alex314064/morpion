require_relative 'player'
require_relative 'board'


class Game
	attr_accessor :player1, :player2, :current_player, :status, :mon_board
	def initialize(names = false)
		if !names 
			names = {}
		puts "Avant de commencer, choisis le nom des joueurs"
		puts "joueur 1"
		names["name1"] = gets.chomp
		puts "joueur 2"
		names["name2"] = gets.chomp
		end
		@player1 = Player.new(names["name1"], '❌', 1)
		@player2 = Player.new(names["name2"], '⭕', 100)
		dice = rand(1..2)
		@current_player = dice == 1 ? @player1 : @player2
		puts "Le grand tirage au sort a désigné #{@current_player.name} comme premier joueur !!!"
		@status = "on going"
		@mon_board = Board.new
		
	end
	
	def turn	
		loop do 
			puts
			puts "C'est à #{@current_player.name} de jouer"
			puts ""
			@mon_board.play_turn(@current_player)
			break if game_end
			if @current_player == @player1
				@current_player = @player2
			else
				@current_player = @player1
			end
			
		end
		new_round
	end
	
	def new_round
		puts "voulez-vous recommencer?(O/N)"
		choice = gets.chomp.upcase
		if choice == "O"
			names = {"name1" => @player1.name, "name2" => @player2.name}
			initialize(names)
			puts
			puts "Et c'est repartiiiiis !!! 🚀🚀🚀🚀"
			puts
			turn
		else
			puts " Dommage!!! 😭 "
		end
	end
	
	def game_end
		if @mon_board.victory?
			@mon_board.board_print
			puts "la partie est fini, #{@current_player.name} a gagné !!! 🎉"
			return true
		elsif !@mon_board.array_9_cases.find {|board_case| board_case.value == 0}
			@mon_board.board_print
			puts "C'est une égalité, try again!"
			return true
		else
			return false
		end
	end    
end
