# frozen_string_literal: true

lines = File.read('day04_2022.txt')

sol_part1 = 0
sol_part2 = 0
pairs = lines.split.map { |e| e.split(',') }
pairs.each do |pair|
  pair.map! { |p| p.split('-').map(&:to_i) }.map! { |p| (p.first..p.last).to_a }
  sol_part1 += 1 if pair.first.all? { |x| pair.last.include? x } || pair.last.all? { |x| pair.first.include? x }
  sol_part2 += 1 if pair.first.any? { |x| pair.last.include? x } || pair.last.any? { |x| pair.first.include? x }
end

puts "Solution part 1: #{sol_part1}"
puts "Solution part 2: #{sol_part2}"
