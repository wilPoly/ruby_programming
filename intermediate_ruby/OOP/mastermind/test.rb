code = [2, 2, 1, 1]
guess = [1, 2, 2, 2]
clues = {}

# guess.each_index do |i|
#     if code[i] == guess[i] # works
#         clues << "B"
#     elsif code.include?(guess[i]) # 
#         clues << "W"
#     end
# end

# puts clues.inspect


guess.each_with_index do |e, i|
  if code[i] == e
    clues[i] = "B"
  elsif code.include?(e) && !(clues.has_key?(i))
    clues[i] = "W"
  end
end

