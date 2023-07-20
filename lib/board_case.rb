class BoardCase
  attr_accessor :id_case, :value, :occupied_by
  
  def initialize(string)
    @id_case = string
    @value = 0
    @occupied_by = 'vide'
  end
  
end