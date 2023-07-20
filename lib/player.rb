class Player
  
  attr_reader :name, :player_id, :value # value = 1 (player1) && value = 2 (player2)
  
  def initialize(player_name, player_category, value_weight)
    #TO DO : doit régler son nom et sa valeur
    @name = player_name
    @player_id = player_category # le X ou le O
    @value = value_weight
  end
  
end