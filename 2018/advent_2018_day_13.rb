begin
	instruction = IO.read('advent_2018_day_7_input.txt')
	instruction.gsub!(/Step /,'').gsub!(/ must be finished before step /,',').gsub!(/ can begin./,'')
	instruction = instruction.split("\n")
	instruction.map! { |e| e.split(",")}
	instruction_hash = Hash.new

end