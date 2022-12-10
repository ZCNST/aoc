# b inc 5 if a > 1
# a inc 1 if b < 5
# c dec -10 if a >= 1
# c inc -20 if c == 10

unusual_reg_instr = []
register = {}

File.open('dayeight.txt').each do |instruction|
	_a = instruction.gsub(/ if/, '').split(' ')
	register_name = _a[0]
	possible_other_register = _a[3]
	condition = "register[\""+_a[3] + "\"]" + _a[4] + _a[5]
	value_to_sum = _a[1] == "inc" ? _a[2].to_i : -_a[2].to_i
	unusual_reg_instr << [register_name, value_to_sum, condition]
	register[register_name] = 0 
	register[possible_other_register] = 0
end
require 'pp'

solution_part_2 = 0
unusual_reg_instr.each do |instruction|
	register[instruction[0]] += instruction[1] if eval(instruction[2])
	solution_part_2 = register[instruction[0]] if solution_part_2 < register[instruction[0]]
end
solution_part_1 = register.values.max

puts "Solution Day 8 - Part 1: #{solution_part_1}"
puts "Solution Day 8 - Part 2: #{solution_part_2}"
