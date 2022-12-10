# Day 2 - Part 1
checksum_part_1 = 0
checksum_part_2 = 0
File.open('daytwo.txt').each do |line|
  	array = line.split("\t").map { |e| e.to_i}
	checksum_part_1 += array.max - array.min
	array.permutation(2).to_a.each { |e| checksum_part_2 += e[0].to_f/e[1].to_f if e[0].to_f % e[1].to_f == 0}
end
puts "Checksum part 1 = #{checksum_part_1}"
puts "Checksum part 2 = #{checksum_part_2}"