
# Create the set S of 1296 possible codes (1111, 1112 ... 6665, 6666)
pegs = [1, 2, 3, 4, 5, 6]
set = pegs.repeated_permutation(4).to_a

# Start with initial guess 1122 (Knuth gives examples showing that other first guesses such as 1123, 1234 do not win in five tries on every code)
  guess = [1, 1, 2, 2]
  
# Play the guess to get a response of colored and white pegs.
  puts guess
  print "> "
  clue_raw = $stdin.gets.chomp.downcase
  clue = clue_raw.split("").map { |i| i.to_i }
# If the response is four colored pegs, the game is won, the algorithm terminates.
  if clue.all? { |i| i == "B" }
    win
  else
    @board.guess(input)
    
  
# Otherwise, remove from S any code that would not give the same response if it (the guess) were the code.

# Apply minimax technique to find a next guess as follows: For each possible guess, that is, any unused code of the 1296 not just those in S, calculate how many possibilities in S would be eliminated for each possible colored/white peg score. The score of a guess is the minimum number of possibilities it might eliminate from S. A single pass through S for each unused code of the 1296 will provide a hit count for each colored/white peg score found; the colored/white peg score with the highest hit count will eliminate the fewest possibilities; calculate the score of a guess by using "minimum eliminated" = "count of elements in S" - (minus) "highest hit count". From the set of guesses with the maximum score, select one as the next guess, choosing a member of S whenever possible. (Knuth follows the convention of choosing the guess with the least numeric value e.g. 2345 is lower than 3456. Knuth also gives an example showing that in some cases no member of S will be among the highest scoring guesses and thus the guess cannot win on the next turn, yet will be necessary to assure a win in five.)
# Repeat from step 3.


