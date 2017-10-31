def substrings (word, dictionary)
	listing = {}
	word.downcase!
	word = word.scan(/\w+/)
	word.each do |word|
		dictionary.each do |item|
			word.match(item) do |m|
				if listing.has_key? (item)
					listing[item] += 1
				else
					listing[item] = 1
				end
			end
		end
	end

	puts listing

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word = "below"
substrings word, dictionary
word = "Howdy partner, sit down! How's it going?"
substrings word, dictionary