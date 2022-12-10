# frozen_string_literal: true

lines = File.read('day07_2022.txt').split("\n")

path = []
size = {}

lines.each do |line|
  cmd = line.strip.split
  case cmd[1]
  when 'cd'
    if cmd[2] == '..'
      path.pop
    else
      path << cmd[2]
    end
  when 'ls'
    next
  else
    path.length.times do |l|
      size[path[0..l].join('-')] ||= 0
      size[path[0..l].join('-')] += cmd[0].to_i
    end
  end
end

sol1 = size.values.keep_if { |e| e <= 100_000 }.sum
p sol1

to_free = 30_000_000 - (70_000_000 - size['/'])
sol2 = size.values.keep_if { |e| e >= to_free }.min

p sol2
