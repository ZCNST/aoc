# frozen_string_literal: true

def count_scenic_score(direction_array, curr_tree)
  arr = []
  direction_array.each do |e|
    arr << e && break unless e < curr_tree

    arr << e
  end
  arr.size
end

trees = File.read('day08_2022.txt').split("\n").map { |m| m.split('').map(&:to_i) }

visible_count = 0
highest_scenic_score = 0

trees.length.times do |i|
  trees[i].length.times do |y|
    if i.zero? || y.zero? || i == trees.length - 1 || y == trees[i].length - 1
      visible_count += 1
    else
      left = (0..y - 1).to_a.map { |e| trees[i][e] }.reverse
      right = (y + 1..trees[i].length - 1).to_a.map { |e| trees[i][e] }
      top = (0..i - 1).to_a.map { |e| trees[e][y] }.reverse
      bottom = (i + 1..trees.length - 1).to_a.map { |e| trees[e][y] }

      visible_count += 1 if left.all? { |e| e < trees[i][y] } ||
                            right.all? { |e| e < trees[i][y] } ||
                            top.all? { |e| e < trees[i][y] } ||
                            bottom.all? { |e| e < trees[i][y] }

      curr_scenic_score = count_scenic_score(left, trees[i][y]) *
                          count_scenic_score(right, trees[i][y]) *
                          count_scenic_score(top, trees[i][y]) *
                          count_scenic_score(bottom, trees[i][y])

      highest_scenic_score = curr_scenic_score if curr_scenic_score > highest_scenic_score
    end
  end
end

puts "Solution day 8 part 1: #{visible_count}"
puts "Solution day 8 part 2: #{highest_scenic_score}"
