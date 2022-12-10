# frozen_string_literal: true

input = File.read('day02_2017.txt')
            .split("\n")
            .map { |e| e.split.map(&:to_i) }

# part 1
sol_part1 = input.map { |e| e.max - e.min }.sum
puts "Solution part 1: #{sol_part1}"

# part 2
sol_part2 = input.map do |line|
  line.permutation(2)
      .to_a
      .map { |pair| pair.first.to_f / pair.last }
      .keep_if { |division_result| (division_result % 1).zero? }
end.flatten.sum.to_i
puts "Solution part 2: = #{sol_part2}"
