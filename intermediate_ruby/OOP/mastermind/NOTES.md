#Notes

#### [Source](https://en.wikipedia.org/wiki/Mastermind_(board_game))

#### [5-move AI - D.E. Knuth algorithm](http://www.cs.uni.edu/~wallingf/teaching/cs3530/resources/knuth-mastermind.pdf)

#### Elements:
-decoding board
-6 code pegs (1..6)
-key pegs (white => right color, wrong place and black => right color, right place)

#### 2 players :
-codemaker
-codebreaker

**12 turns**

The codemaker gets one point for each guess a codebreaker makes. 
An extra point is earned by the codemaker if the codebreaker doesn't guess the pattern exactly in the last guess.

----

#### Player is codebreaker / computer is codemaker

Board
	-shielded 4 color code => randomly generated, **repetition is permitted**
	-4 slots => code guessing (6 color combinations)
	-4 slots => code clues (**white** => right color, wrong place and **black** => right color, right place)

Players
	-codemaker (AI) => randomly chooses a combination and returns the code clues
	-codebreaker => has 12 turns to guess the combination

Engine
	-launches the game
	-displays the board
	-loops turns until success or end of 12 turns
	-asks if player wants to player another game

### Progress
    class Engine => game_turn input guess
	class Board => gen_code in private
	Board#guess works
end_game, win/lose announcement => works
Board#win? => works
    Reformat board display
Choose between codebreaker/codemaker



