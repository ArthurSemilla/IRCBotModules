require_relative 'dictionary.rb'

def checkOneMore(possible, actual) #possible is greater than actual
	isCorr = true

	for i in 0..actual.length-1
		if actual[i] != possible[i]
			isCorr = false
			break
		end
	end

	if isCorr
		puts possible
	end

	return
end

def checkOneLess(possible, actual) #possible is less than actual
	isCorr = true

	for i in 0..possible.length-1
		if actual[i] != possible[i]
			isCorr = false
			break
		end
	end

	if isCorr
		puts possible
	end

	return
end

def checkSameLen(possible, actual) #possible is same length as actual
	numWrong = 0

	for i in 0..actual.length-1
		if actual[i] != possible [i]
			numWrong = numWrong + 1
		end
	end

	if(numWrong <= actual.length/2)
		puts possible
	end
	return
end

def findCorrections(val)
	num = val[0].ord % 97
	poss = Array.new

	for x in 0..WORDS[num].length-1
		if WORDS[num][x].length - val.length == 1
			checkOneMore(WORDS[num][x], val)
		end
		if WORDS[num][x].length - val.length == -1
			checkOneLess(WORDS[num][x], val)
		end
		if WORDS[num][x].length == val.length
			checkSameLen(WORDS[num][x], val)
		end
	end

	return
end


STDOUT.flush
sentence = gets.chomp
words = sentence.split(" ")
swt = false

words.each do |val|
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
