# Thomas Recchiuto
# Advent of Code - Day 6 

stream_array = IO.read('daynine.txt').gsub(/!./,'').chars
garbage = false

stream_array_full = stream_array.map do |c| 
	if c == '<'
 		garbage = true
	elsif c == '>'
		garbage = false
	end

 	(c == '{' or c == '}') && !garbage ? c : nil

end.compact

solution_part_1 = 0
val = 0

stream_array_full.each do |c|
 	if c == '{'
 		val += 1
 		solution_part_1 += val
 	elsif c == '}'
 		val -= 1
 	end
end

puts "Day 6 - Part 1: #{solution_part_1}"

stream_array_no_garbage = stream_array.map do |c|
	if c == '<'
 		garbage = true
	elsif c == '>'
		garbage = false
	end
end


