def substrings (word, dictionary)
	listing = {}
	matches = []
	sub_count = 0

	dictionary.each do |item|
		#word.scan(item) #return multiple arrays...
		match_item = Regexp.new(item, Regexp::IGNORECASE)
		word.match(match_item) { |m| matches << item }
	end

	p matches

	matches.each do |item|
		sub_count = matches.count(item)
		listing.store(item, sub_count)
	end

	puts listing

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word = "below"
substrings word, dictionary
word = "Howdy partner, sit down! How's it going?"
substrings word, dictionary