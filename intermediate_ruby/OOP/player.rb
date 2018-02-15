require './board'

class Player

  attr_accessor :name, :score

  def initialize(name, score=0)
    @name = name
    @score = score
  end

  def put_mark(location)
    location = 
  end

  def win
    @score += 1
  end

end