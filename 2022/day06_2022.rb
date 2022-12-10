# frozen_string_literal: true

lines = File.read('day06_2022.txt')

signal = lines.strip.split('')

solp1 = nil
solp2 = nil

start_of_packet_marker = 4
start_of_message_marker = 14

signal.length.times do |i|
  solp1 = i + 3 + 1 if !solp1 && signal[i..(i + 3)].uniq.length == start_of_packet_marker

  solp2 = i + 13 + 1 if !solp2 && signal[i..(i + 13)].uniq.length == start_of_message_marker

  break if solp1 && solp2
end

puts solp1.to_s
puts solp2.to_s
