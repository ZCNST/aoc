# Day 6 advent of code

# Questo medoto effettua la ridistribuzione
# Prende in input l'array di interi
# Trova il massimo (max) e il suo indice (start)
# Cicla distribuendo max volte sull'array input
# Trova l'indice usando il modulo per non andare out of bounds
def redistribution(input)
	max = input.max
	start = input.index(max)
	input[start] = 0
	for i in (start+1..max+start)
		input[i % MODULO] += 1
	end
	input
end

begin
	input = [11, 11, 13, 7, 0, 15, 5, 5, 4, 4, 1, 1, 7, 1, 15, 11]
	#input = [0, 2, 7, 0]
	MODULO = input.length
	what_seen_before = []
	seen = false
	counter = 0
	while !seen
		what_seen_before << input.join('-')
		input = redistribution(input)
		seen = what_seen_before.include? input.join('-')
		counter += 1
	end

	puts "Solution day 6 part 1: #{counter}"
	found = input.join('-')
	number_of_cycles  = what_seen_before.index(found)
	puts "Solution day 6 part 2: #{counter - number_of_cycles}"
end