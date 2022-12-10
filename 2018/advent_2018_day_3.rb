# DAY 3
claims = File.readlines('advent_2018_day_3_input.txt').map { |line|  line.chomp }

# PART 1
claims_formatted = Hash.new([])
all_ids = []
claims.each do |c|
	id = c[/#[1234567890]*/]
	all_ids << id
	start = c[/[1234567890]*,[1234567890]*/]
	area = c[/[1234567890]*x[1234567890]*/]
	abscissa = start.split(',')[0].to_i
	ordinate = start.split(',')[1].to_i
	plus_x = (area.split('x')[0].to_i)-1
	plus_y = (area.split('x')[1].to_i)-1


	for a in 0..plus_x do
		for b in 0..plus_y do
			current_square = "#{abscissa + a},#{ordinate + b}"
			to_add = claims_formatted.fetch(current_square, []) << id
			claims_formatted[current_square] = to_add
		end
	end
end

puts "Day 3 part 1 solution: #{claims_formatted.select { |k,v| v.size > 1 }.count}"


# PART 2
overlapped_ids = claims_formatted.select { |k,v| v.size > 1 }.values.flatten.uniq
puts "Day 3 part 2 solution: #{(all_ids - overlapped_ids).first}"
