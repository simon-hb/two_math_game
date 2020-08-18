  
class Player
  attr_reader :name
  attr_accessor :hp

  def initialize(name)
    # an instance variable. Each object comes with these 2 variables
    @name = name
    @hp = 3
  end

  # player dead check. could instead do while lives > 0 in games.rb
  def dead?
    @hp <= 0
  end

  # lose hp when wrong
  def hp_loss
    @hp -= 1

  end


end