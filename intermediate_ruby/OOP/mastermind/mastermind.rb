class Engine

  def initialize
    # create Board
    @board = Board.new
  end

  def new_game
    
  end

  def game_turn
    puts "You must guess a combination of 4 numbers (1..6)"
    print "> "
    guess_raw = $stdin.gets.chomp
    # processes the input into an array
    guess = guess_raw.split("").map { |i| i.to_i }
  end

  def end_game
  end

end

class Board

  def initialize
    gen_code
  end

  def guess(x1, x2, X3, x4)

  end

  def draw_board
    # displays the previous turns (x1, x2, x3, x4)
    # and the corresponding response (b, w or more)
  end

  private

  def gen_code
     @code = []
    # random hidden code generated
    4.times { @code << rand(1..6) }
  end




end