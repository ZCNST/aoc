# Day 3 - Part 1


# Set up delle variabili
puzzle_input = 347991
square_value = 1
lunghezza_lato_spirale = 1	

# Creo la spirale creando un array di array
$spiral_memory = Array.new(1) { Array.new }



begin 	

 	for i in 1..lunghezza_lato_spirale do
 		$spiral_memory[$spiral_memory.count-1] << square_value
 		square_value += 1
 	end

 	$spiral_memory.unshift [] 
 	
 	for i in 1..lunghezza_lato_spirale do
		$spiral_memory[$spiral_memory.count-i] << square_value 
		square_value += 1
	end


 	lunghezza_lato_spirale += 1
 	
 	for i in 1..lunghezza_lato_spirale do
 		$spiral_memory[0].unshift square_value
 		square_value += 1
 	end

 	$spiral_memory << []
	
	for i in 1..lunghezza_lato_spirale do
		$spiral_memory[i-1].unshift square_value
		square_value += 1
 	end


 	lunghezza_lato_spirale += 1

end while square_value < puzzle_input


input_row = 0
input_column = 0
spiral_central_row = 0
spiral_central_column = 0

$spiral_memory.each_with_index do |line, i|
	x = line.index(puzzle_input) 
 	input_column = x if x
 	input_row = i if x
end

$spiral_memory.each_with_index do |line, i|
	x = line.index(1) 
 	spiral_central_column = x if x
 	spiral_central_row = i if x
end

solution_part_one = (spiral_central_row - input_row).abs + (input_column - spiral_central_column).abs

puts "Soluzione Day 3 Part 1 = #{solution_part_one}"



$spiral_memory_part_two = [
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0]
]

def sum(x,y)
	val = 0
	a = [[x+1,y], [x,y+1], [x-1,y], [x,y-1], [x-1,y-1], [x-1,y+1], [x+1,y-1], [x+1,y+1]]

	a.each do |coppia|
		val += $spiral_memory_part_two[coppia[0]][coppia[1]] if $spiral_memory_part_two[coppia[0],coppia[1]]
	end
	return val 
end

counter = 1

new_row = 5
new_column = 5

begin
	
	for i in 1..counter
		if counter % 2 == 0
			new_column -= 1
		else 
			new_column += 1
		end
		$spiral_memory_part_two[new_row][new_column] = sum(new_row, new_column) if $spiral_memory_part_two[new_row][new_column]
	end

	for i in 1..counter
		if counter % 2 == 0
			new_row += 1
		else 
			new_row -= 1
		end
		$spiral_memory_part_two[new_row][new_column] = sum(new_row, new_column) if $spiral_memory_part_two[new_row][new_column]
	end

	counter += 1

end while counter < 4

$spiral_memory_part_two.each { |line| puts line.join("\t")}



