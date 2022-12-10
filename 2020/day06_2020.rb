# frozen_string_literal: true

lines = File.read('day06_2020.txt')

sol_part1 = lines.split("\n\n").map do |group|
  group.split.map { |e| e.split('') }.flatten.uniq.length
end.sum
puts "Solution day 1 part 1 = #{sol_part1}"

sol_part2 = 0
lines.split("\n\n").each do |group|
  group = group.split.map! { |e| e.split('') }
  z = group.flatten.tally.keep_if { |_key, value| value == group.size }
  sol_part2 += z.size
end

puts "Solution day 1 part 2 = #{sol_part2}"
