def caesar_cipher (phrase, modifier)
  alphabet = ("a".."z").to_a
  phrase = phrase.split("")
  translation = phrase.map do |char|
    if char =~ /[a-zA-Z]/
      temp = alphabet.index(char)
      temp = temp - modifier
      if char =~ /[A-Z]/
        char = alphabet[temp].upcase
      else
        char = alphabet[temp]
      end
    else char
    end
  end
  return translation.join("")
end

caesar_cipher("hello mister world", 5)