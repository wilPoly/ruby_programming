def caesar_cipher (phrase, modifier)
  alphabet = ("a".."z").to_a
  phrase = phrase.split("")
  # temp = 0
  translation = phrase.map do |char|
    if char =~ /[A-Z]/
      char = char.downcase
      temp = alphabet.index(char) - modifier
      char = alphabet[temp].upcase
    elsif char =~ /[a-z]/
      temp = alphabet.index(char) - modifier
      char = alphabet[temp]
    else
      char
    end
  end
  return translation.join("")
end

puts "Enter the phrase you wish to encrypt"
phrase = gets.chomp
puts "Enter the number of letters you wish to shift"
modifier = gets.chomp.to_i
puts caesar_cipher(phrase, modifier)