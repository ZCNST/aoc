# frozen_string_literal: true

lines = File.read('day01_2022.txt')

sol = lines.split("\n\n").map { |e| e.split.map(&:to_i).sum }.flatten.sort

puts "Solution part 1: #{sol.last}"
puts "Solution part 2: #{sol[-1] + sol[-2] + sol[-3]}"
