# frozen_string_literal: true

input = File.read('day01_2017.txt').strip.split('').map(&:to_i)

# part 1
sol_part1 = 0
input.each_with_index do |digit, index|
  sol_part1 += digit if digit == input[(index + 1) % input.length]
end
puts "Solution part 1: #{sol_part1}"

sol_part2 = 0
input.each_with_index do |digit, index|
  sol_part2 += digit if digit == input[(index + (input.length / 2)) % input.length]
end
puts "Solution part 1: #{sol_part2}"
