input = File.open('dayfive.txt').map {|e| e.to_i}
#input = [0, 3,  0,  1,  -3]

def day_five_part1(list_of_jump) 
	current_position = 0
	counter = 0
	while list_of_jump[curr_pos]
		next_pos = curr_pos + list_of_jump[curr_pos]
		list_of_jump[curr_pos] += 1
		curr_pos = next_pos
		counter += 1
		puts list_of_jump.inspect
	end
	counter
end


def day_five_part2(list_of_jump)
	curr_pos = 0
	counter = 0
	while list_of_jump[curr_pos]
		next_pos = curr_pos + list_of_jump[curr_pos]
		
		if list_of_jump[curr_pos] < 3
			list_of_jump[curr_pos] += 1
		else
			list_of_jump[curr_pos] -= 1
		end
		
		curr_pos = next_pos
		
		counter += 1
	end
	counter
end

#puts "Day 5 part 1 solution: #{day_five_part1(input)}"
puts "Day 5 part 2 solution: #{day_five_part2(input)}"