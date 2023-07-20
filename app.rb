require 'pry'
require_relative 'lib/game'

class Application 
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while 
    #pour faire tourner le jeu tant que la partie n'est pas terminée.
   
     mon_game = Game.new 

    # #binding.pry
     mon_game.turn
    
  end
  
end


Application.new.perform