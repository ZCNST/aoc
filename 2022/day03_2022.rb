# frozen_string_literal: true

lines = File.read('day03_2022.txt')

val = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

sol_part1 = 0
rucksacks = lines.split
rucksacks.each do |rucksack|
  c1 = rucksack[0..((rucksack.length / 2) - 1)].strip.split('').uniq
  c2 = rucksack[((rucksack.length / 2))..-1].strip.split('').uniq
  x = c1 - (c1 - c2)
  if c1 - (c1 - c2) == c2 - (c2 - c1)
    sol_part1 += (val.find_index(x.first) + 1)
  else
    p 'error'
  end
end

puts "Solution part 1: #{sol_part1}"

i = 0
sol_part2 = 0
while i < rucksacks.length
  x = rucksacks[i].strip.split('').uniq + rucksacks[i + 1].strip.split('').uniq + rucksacks[i + 2].strip.split('').uniq
  x = x.tally.key(3)
  sol_part2 += (val.find_index(x) + 1)

  i += 3
end

puts "Solution part 2: #{sol_part2}"
