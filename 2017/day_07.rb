# Thomas Recchiuto - Advent of Code 2017 - Day 7 

require 'pp'

# This method parses the input of the day 7 and returns it as array of array
# In position 0 there is the program name
# In position 1 there is the weigth
# In the others position 2..n there are the names of the programs immediatly above the program in position 0

def parsing_the_input(input_file)
	array = Array.new
	File.open(input_file).each do |program|
		line_parsed = program.gsub(/([a-z]*).\(([0-9]*)\)/,'\1,\2').gsub(/\n/,'').gsub(/ /,'').gsub(/->/,',')
		array << line_parsed.split(',')
	end
	array
end

def find_the_root(program_list, root_candidate)
	new_candidate = program_list.find { |line| line[2..line.length].find { |program| program.eql? root_candidate[0] } }
	if new_candidate
		find_the_root(program_list, new_candidate) 
	else
		root_candidate
	end
end

program_list = parsing_the_input('dayseven.txt')
root_record = find_the_root(program_list, program_list.find { |line| line.length > 2})

puts "Day 7 - Part 1 solution: #{root_record[0]}"

# Day 7 - Part 2

Node = Struct.new(:name, :weigth, :children, :tower_weigth) do
	def has_children?
		children.size==0 ? false : true 
	end
end

def insert_child(list_of_children, program_list)
	a = []
	list_of_children.each do |child|
		node_record = program_list.find { |node_record| node_record[0]==child }
		a << Node.new(node_record[0], node_record[1], insert_child(node_record[2..node_record.length], program_list), 0)
	end
	return a
end

tree = Node.new(root_record[0], root_record[1], insert_child(root_record[2..root_record.length], program_list), 0)

def set_tower_wigth(node)	
	if node.has_children?
		for i in 0..node.children.length-1
			set_tower_wigth(node.children[i])
			node.tower_weigth += node.children[i].tower_weigth.to_i
		end
		node.tower_weigth += node.weigth.to_i
	else
		node.tower_weigth = node.weigth.to_i
	end
end

set_tower_wigth(tree)

def balancing_status(node, result_array)
 	same_level_tower_weigths = []
 	node.children.each { |e| same_level_tower_weigths << e.tower_weigth}

 	unbalanced_tower = same_level_tower_weigths.max == same_level_tower_weigths.min ? nil : same_level_tower_weigths.index(same_level_tower_weigths.max)
 	if unbalanced_tower == nil
 		return result_array
 	else
 		result_array << same_level_tower_weigths
 		balancing_status(node.children[unbalanced_tower], result_array)
 	end
end


bl = balancing_status(tree, [])
if !bl.empty?
	difference = (bl.last.max-bl.last.min)
	node = tree

	for i in 0..bl.length-1
		n = bl[i].index(bl[i].max)
		node = node.children[n]
	end
	puts "Day 7 - Part 2 solution: #{node.weigth.to_i - difference}"
else
	puts "TOWERS BALANCED"
end

