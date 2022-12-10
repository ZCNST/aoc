require 'date'

begin

	# format the input
	guard_records = IO.read('advent_2018_day_4_input.txt')
	guard_records = guard_records.gsub!(/\[/, '').gsub!(/\] /, ',').gsub!(/ begins shift/,'').split("\n")
	guard_records.map! { |e| e.split(',') }
	guard_records.each { |e| e[0] = DateTime.parse(e[0]) }.sort!

	
	# put the input in a hash ordinated and sorted
	
	minutes_hash = Hash.new()
	current_guard = nil
	start_sleep = nil
	stop_sleep = nil

	for i in 0..guard_records.length-1 do
		if guard_records[i][1].start_with? "Guard"
			current_guard = guard_records[i][1]
		end
		if guard_records[i][1].start_with? "falls"
			start_sleep = guard_records[i][0]
		end
		if guard_records[i][1].start_with? "wakes"
			stop_sleep = guard_records[i][0]
		end

		if !start_sleep.nil? && !stop_sleep.nil?
			for x in start_sleep.strftime('%M').to_i..stop_sleep.strftime('%M').to_i-1
				to_add = minutes_hash.fetch(current_guard.gsub(/Guard #/,''), []) << x
				minutes_hash[current_guard.gsub(/Guard #/,'')] = to_add
			end
			start_sleep = nil
			stop_sleep = nil			
		end
	end
	


	# SOLUTION PART 1
	solution_part_1 = Hash.new()
	minutes_hash.each_pair do |k,v| 
		freq = v.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		solution_part_1[v.size] = k.to_i * v.max_by { |v| freq[v] }
	end
	p "Day 4 - Part 1: #{solution_part_1[solution_part_1.keys.max_by { |e| e} ]}"


	# SOLUTION PART 2
	solution_part_2 = Hash.new()
	minutes_hash.each_pair do |guard_id, minutes_array| 
		freq = minutes_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		solution_part_2[guard_id.to_i] = minutes_array.max_by { |v| freq[v] }
		solution_part_2[guard_id.to_i] = [solution_part_2[guard_id.to_i], freq[solution_part_2[guard_id.to_i]]]
	end
	minutes_occurence_pair = solution_part_2.values.max_by { |e| e[1] }
	p "Day 4 - Part 2: #{solution_part_2.key(minutes_occurence_pair) * minutes_occurence_pair[0]}"
end
