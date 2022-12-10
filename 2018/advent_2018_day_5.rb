polymer = IO.read('advent_2018_day_5_input.txt')

$regexp_str = ""
("a".."z").each do |character|
	$regexp_str = $regexp_str + "#{character}#{character.upcase}|#{character.upcase}#{character}|"
end

def reacting_the_polymer(pol)
	l = 0
	regexp = Regexp.new $regexp_str
	until l == pol.length
		l = pol.length
		pol.gsub!(regexp,'')
	end
	pol
end


#PART 1
solution_part_1 = reacting_the_polymer(polymer).length
puts "Day 5 Part 1: #{solution_part_1}"


#PART 2
solution_part_2 = []
polymer_sol_2 = polymer
("a".."z").each do |char_to_remove|
	x = Regexp.new "#{char_to_remove}|#{char_to_remove.upcase}"
	solution_part_2 << reacting_the_polymer(polymer_sol_2.gsub(x,'')).length
end

puts "Day 5 Part 1: #{solution_part_2.min_by {|e| e}}"














