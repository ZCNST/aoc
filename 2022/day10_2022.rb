# frozen_string_literal: true

lines = File
        .read('day10_2022.txt')
        .split("\n")
        .map! { |line| line.start_with?('addx') ? line.split(' ') : line }
        .flatten!
        
interesting_signal_strength = [20, 60, 100, 140, 180, 220]
register_value = 1

register = lines.map do |instruction|
  if %w[addx noop].include?(instruction)
    register_value
  else
    register_value += instruction.to_i
  end
end

sol_part1 = interesting_signal_strength.map { |ss| register[ss - 2] * ss }
puts "Solution part 1: #{sol_part1.sum}"

sprite_position = 1
sol_part2 = []

register.each_with_index do |value, index|
  draw_lit_pixel = sprite_position == index % 40 ||
                   sprite_position - 1 == index % 40 ||
                   sprite_position + 1 == index % 40

  sol_part2 << if draw_lit_pixel
                 '#'
               else
                 ' '
               end
  sprite_position = value
end

puts "\nSolution part 2:"
sol_part2.each_slice(40) do |e|
  puts e.join
end
