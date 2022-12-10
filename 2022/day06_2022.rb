# frozen_string_literal: true

lines = File.read('day06_2022.txt')

signal = lines.strip.split('')

sol_part1 = nil
sol_part2 = nil

start_of_packet_marker = 4
start_of_message_marker = 14

signal.length.times do |i|
  sol_part1 = i + 3 + 1 if !sol_part1 && signal[i..(i + 3)].uniq.length == start_of_packet_marker

  sol_part2 = i + 13 + 1 if !sol_part2 && signal[i..(i + 13)].uniq.length == start_of_message_marker

  break if sol_part1 && sol_part2
end

puts "Solution part 1: #{sol_part1.to_s}"
puts "Solution part 2: #{sol_part2.to_s}"
