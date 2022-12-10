coordinates = File.readlines('advent_2018_day_6_input.txt').map { |line|  line.split(',').map {|e| e.to_i} }

coordinates_hash = Hash.new
count = 0
coordinates.each do |c| coordinates_hash
	coordinates_hash[('AA'..'ZZ').to_a[count]] = c
	count = count + 1
end

min_coordinates = [coordinates_hash.values.min_by { |e| e[0]}[0], coordinates_hash.values.min_by { |e| e[1]}[1]]
max_coordinates = [coordinates_hash.values.max_by { |e| e[0]}[0], coordinates_hash.values.max_by { |e| e[1]}[1]]


matrix_hash = Hash.new
# infinite_areas_id = ['.']

# for x in min_coordinates[0]..max_coordinates[0] do
# 	for y in min_coordinates[1]..max_coordinates[1] do
# 		matrix_hash[[x,y]] = ['ZZ',1000000000]		
# 		coordinates_hash.each_pair do |key, val|
# 			if x == val[0] && y == val[1]
# 				matrix_hash[[x,y]] = [key, 0] 
# 				break
# 			end
# 			distance = (x - val[0]).abs + (y - val[1]).abs
# 			if matrix_hash[[x,y]][1] > distance
# 				matrix_hash[[x,y]] = [key, distance] 
# 			elsif matrix_hash[[x,y]][1] == distance
# 				matrix_hash[[x,y]] = ['.', distance] 
# 			end
# 		end
# 	end
# end

# matrix_hash.each_pair do |key, value|
# 	if key[0] == min_coordinates[0] || key[0] == max_coordinates[0] || key[1] == min_coordinates[1] || key[1] == max_coordinates[1]
# 		infinite_areas_id << value[0]
# 	end
# 	infinite_areas_id = infinite_areas_id.uniq
# end

# matrix_hash.delete_if do |k,v|
# 	infinite_areas_id.include? v[0]
# end

# PART 1 
solution_part_1 = matrix_hash.values.map { |v| v[0] }.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.values.max_by { |e| e}
puts "Solution Day 6 part 1: #{solution_part_1}"





# PART 2 
safe_area_coordinates = []
for x in min_coordinates[0]..max_coordinates[0] do
	for y in min_coordinates[1]..max_coordinates[1] do
	total_distance = 0
		coordinates_hash.each_pair do |key, val|
			break if total_distance > 10000
			total_distance = total_distance + (x - val[0]).abs + (y - val[1]).abs
		end
		safe_area_coordinates << [x,y] if total_distance < 10000
	end
end
puts "Solution Day 6 part 1: #{safe_area_coordinates.uniq.size}"



