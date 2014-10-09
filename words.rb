require_relative 'dictionary.rb'

def getScore(poss, act)
	mod = 0
	numWrong = 0

	for i in 0..act.length-1
		if act[i+mod] == poss[i+mod]
			mod = mod
		elsif act[i+mod] == poss[i+mod+1]
			mod = mod + 1
			numWrong = numWrong + 1
		elsif act[i+mod+1] == poss[i+mod]
			mod = mod - 1
			numWrong = numWrong + 1
		else
			numWrong = numWrong + 1
		end
	end
	return act.length - (poss.length - act.length).abs - numWrong*2
end

def findCorrections(val)
	num = val[0].ord % 97
	poss = Array.new
	posWords = Hash.new

	for x in 0..WORDS[num].length-1
		if WORDS[num][x].length >= val.length - (val.length/4) - 1 && WORDS[num][x].length <= val.length + (val.length/4) + 1 
			score = getScore(WORDS[num][x],val)
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
