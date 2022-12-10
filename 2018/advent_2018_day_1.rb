
#frequency_change = [+3, +3, +4, -2, -4] test 1
#frequency_change = [-6, +3, +8, +5, -6] test 2

resulting_frequency = [0]
frequency_is_reached_twice = nil
i = 0
frequency_change = File.readlines('advent_2018_day_1_input.txt').map { |line| line.to_i }
while frequency_is_reached_twice.nil?
	puts resulting_frequency[i] if i == frequency_change.length # part 1 solution
	frequency_is_reached_twice = resulting_frequency.index(resulting_frequency.last + frequency_change[i % frequency_change.length])
 	resulting_frequency << resulting_frequency.last + frequency_change[i % frequency_change.length]
 	i = i + 1
end

puts resulting_frequency[frequency_is_reached_twice]

#406