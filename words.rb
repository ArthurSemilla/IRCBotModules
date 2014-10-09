require_relative 'dictionary.rb'

# returns the score of a possible match for the input word (which is wrong)
def getScore(poss, act)
	aMod = 0
	pMod = 0
	numWrong = 0
	count = 0

	# check if some letters where mixed up
	if poss.chars.sort == act.chars.sort
		return 100
	end

	# parse through and determine a score for the comprison
	for i in 0..act.length-1
		if act[i+aMod] == poss[i+pMod]
			# change nothing
		elsif act[i+aMod] == poss[i+pMod+1]
			pMod = pMod + 1
			numWrong = numWrong + 1
		elsif act[i+aMod+1] == poss[i+pMod]
			aMod = aMod + 1
			numWrong = numWrong + 1
		else
			numWrong = numWrong + 1
		end
	end

	# score for the word. Mostly based one length and differences; needs polishing
	return act.length - (poss.length - act.length).abs - numWrong*2
end

# will output words that are similar to the incorrect input based on scores
def findCorrections(val)
	# gets the ascii number value of the first letter of the word, thus selecting the proper sub array for the dictionary
	num = val[0].ord % 97
	# hash used to store words and their scores (if above a threshold)
	posWords = Hash.new

	#iterates through all words starting with the same letter
	for x in 0..WORDS[num].length-1
		if WORDS[num][x].length >= val.length - (val.length/4) - 1 && WORDS[num][x].length <= val.length + (val.length/4) + 1 
			score = getScore(WORDS[num][x],val)
			# threshold of comparison score
			if score > 0
				posWords[score] = WORDS[num][x]
			end
		end
	end

	posWords.sort.reverse.map do |k,v|
		puts v
	end

	return
end

STDOUT.flush
sentence = gets.chomp

while sentence != "-1" do
	words = sentence.split(" ")
	swt = false

	# goes through any word typed and checks to see if valid
	words.each do |val|
		swt = false
		WORDS.each do |sub|
			if sub.include?(val)
				puts "\n#{val} is a valid word!"
				swt = true
				break
			end
		end
		if swt == false
			puts "\n#{val} is an invalid word!\n\n"
			findCorrections(val)
		end
	end

	puts
	STDOUT.flush
	sentence = gets.chomp
end