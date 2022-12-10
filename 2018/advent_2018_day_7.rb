begin
	instruction = IO.read('advent_2018_day_7_input.txt')
	instruction.gsub!(/Step /,'').gsub!(/ must be finished before step /,',').gsub!(/ can begin./,'')
	instruction = instruction.split("\n")
	instruction.map! { |e| e.split(",")}
	instruction_hash = Hash.new
	instruction.each do |array| 
		to_add = instruction_hash.fetch(array[0], []) << array[1]
		instruction_hash[array[0]] = to_add
	end
	step_available = ( instruction_hash.keys - instruction_hash.values.flatten.uniq ).sort
	all_step = ( instruction_hash.keys.flatten.uniq + instruction_hash.values.flatten.uniq ).uniq.sort


# PART 1
	# step_completed = []
	# until step_completed.length == all_step.length
	# 	last_step_done = step_available.shift
	# 	step_available << instruction_hash[last_step_done]
	# 	step_available = step_available.flatten.compact.sort
	# 	instruction_hash.delete(last_step_done)
	# 	step_available.delete_if { |a| instruction_hash.values.flatten.include? a }
	# 	step_completed << last_step_done
	# end

	# solution_part_1 =  step_completed.join
	# puts "Day 7 Part 1: #{solution_part_1}"

# PART 2
	step_completed = []
	seconds = 0
	step_duration_table = all_step.map {|e| [e, 60+all_step.index(e)+1]}
	workers = Array.new(5)


	
	p step_duration_table
	#p step_available



	for i in 0..workers.size-1 do
		workers[i] = step_available.shift if workers[i].nil?
	end
	workers.map! { |w| step_duration_table.find {|e| e[0] == w } }

	#p workers

	until step_completed.length == all_step.length
		seconds += 1
		workers.each do |w| 
			p w
			if w.is_a? Array
				w[1] = w[1] - 1
				if w[1] == 0
					step_available << instruction_hash[w[0]]
					step_available = step_available.flatten.compact.sort
					instruction_hash.delete(w[0])
					step_available.delete_if { |a| instruction_hash.values.flatten.include? a }
					step_completed << w[0]
					workers.map! {|e| e.is_a?(Array) && e[1]==0 ? nil : e}
					for i in 0..workers.size-1 do
						if workers[i].nil?
							next_step = step_available.shift 
							workers[i] = step_duration_table.find {|e| e[0] == next_step }
						end
					end
				end
			end
		end
		p seconds
		
		p "step_completed => #{step_completed}"


		puts "workers => #{workers}"
		puts "_________________________"
	end
	puts step_completed.join
	puts seconds
end