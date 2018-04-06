code = [2, 1, 3, 4]
guess = [1, 1, 2, 2]
clues = []

guess.each_index do |i|
    if code[i] == guess[i] # works
        clues << "B"
    elsif code.include?(guess[i]) # 
        clues << "W"
    end
end

puts clues.inspect