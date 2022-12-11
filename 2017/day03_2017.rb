# frozen_string_literal: true

input = File.read('day03_2017.txt').strip.to_i

# part 1
arr = (1..input).to_a.reverse
counter = 0
spiral = []

spiral << arr.pop(1).reverse.each_slice(1).to_a
until spiral.last.flatten.include?(input)
  counter += 1
  spiral << arr.pop(8 * counter).reverse.each_slice(2 * counter).to_a
end
sol_part1 = counter + (spiral.last.last.find_index(input) - (counter - 1)).abs
puts "Solution part 2: #{sol_part1}"

# part 2
sum_spiral = Array.new(11) { Array.new(11, 0) }

row = sum_spiral.size / 2
column = sum_spiral.size / 2
sum_spiral[row][column] = 1

SUM_CALC = [-1, 0, 1].repeated_permutation(2).to_a

counter = 1
until sum_spiral[row][column] > input

  counter.times do
    column = counter.even? ? column - 1 : column + 1
    sum_spiral[row][column] = SUM_CALC.map { |pair| sum_spiral[row + pair.first][column + pair.last] }.sum
  end

  counter.times do
    row = counter.even? ? row + 1 : row - 1
    sum_spiral[row][column] = SUM_CALC.map { |pair| sum_spiral[row + pair.first][column + pair.last] }.sum
  end

  counter += 1
end

sol_part2 = sum_spiral.flatten.keep_if { |e| e > input }.uniq.min
puts "Solution part 2: #{sol_part2}"
