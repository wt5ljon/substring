# implements the Ruby substring challenge of The Odin Project
def substrings(text, dictionary)
	matches = {}
	# interate through each member of the dictionary array
	dictionary.each do |match|
		sub_string = text.downcase
		matches[match] = 0
		# use the partition method of the string class to find matches
		while sub_string.length != 0 do
			hit = sub_string.partition(match)
			if hit[1].length != 0
				matches[match] += 1
			end
			# update sub_string to the remainder of the string after the match
			sub_string = hit[2]
		end
		# delete the key if no matches found
		if matches[match] == 0
			matches.delete(match)
		end
	end
	return matches
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it",
	          "i", "low", "own", "part", "partner", "sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
