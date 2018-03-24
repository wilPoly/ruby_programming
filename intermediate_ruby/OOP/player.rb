class Player

  attr_accessor :name, :mark, :score

  def initialize(name, mark, score=0)
    @name = name
    @score = score
    @mark = mark
  end

  def win
    @score += 1
    puts "#{player.name} wins !"
  end
end