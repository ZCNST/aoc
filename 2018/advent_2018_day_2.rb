# Day 2

box_ids = File.readlines('advent_2018_day_2_input.txt').map { |line|  line.chomp }
#box_ids = ["abcde","fghij","klmno","pqrst","fguij","axcye","wvxyz"]

# Part 1

double_char_number = 0
triple_char_number = 0

box_ids.each do |w|
	double = false
	triple = false
	w.chars.uniq.each do |char|
		double = true if w.count(char) == 2
		triple = true if w.count(char) == 3
	end
	double_char_number += 1 if double
	triple_char_number += 1 if triple
end
checksum = double_char_number * triple_char_number

puts "Soltion part 1: #{checksum}"

# Part 2
the_two_correct_box_ids = []

box_ids.each do |external|
	box_ids.each do |internal|

		diff_array = []
		for i in 0..external.length-1
			if !(external.chars[i] == internal.chars[i])
				diff_array << external.chars[i]
			end
			break if diff_array.length > 1
		end

		the_two_correct_box_ids << [external, internal] if diff_array.size == 1

	end
end

if the_two_correct_box_ids[0][0] == the_two_correct_box_ids[1][1]
	if the_two_correct_box_ids[1][0] == the_two_correct_box_ids[0][1]
		x = the_two_correct_box_ids[0][0].chars
		y = the_two_correct_box_ids[0][1].chars
	end
end

x.delete((x - y).first
letters_in_common = x.join

puts "Soltion part 1: #{letters_in_common}"