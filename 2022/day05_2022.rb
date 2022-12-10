# frozen_string_literal: true

def parse_stacks(stacks)
  s = stacks
      .split("\n\n")
      .first

  100.times { s = s.gsub(']     ', '] [-] ') }

  s = s.split(' ').map! { |e| e.gsub('[', '').gsub(']', '').strip }

  n_stacks = s.last.to_i

  s = s.each_slice(n_stacks).to_a
  s.reverse!
  h = {}

  n_stacks.times do |i|
    h[s[0][i]] = []
    s[1..n_stacks].each { |e| h[s[0][i]] << e[i] if e[i] != '-' }
    h[s[0][i]] = h[s[0][i]].flatten
  end
  h
end

def parse_moves_crate_mover9000(stack_name, moves)
  cmd = []
  m = moves.split("\n").map { |e| e.split.each_slice(2).to_h }
  m.each do |move|
    cmd << "#{stack_name}[\"#{move['to']}\"].push(#{stack_name}[\"#{move['from']}\"].pop(#{move['move']}).reverse).flatten!"
  end
  cmd
end

def parse_moves_crate_mover9001(stack_name, moves)
  cmd = []
  m = moves.split("\n").map { |e| e.split.each_slice(2).to_h }
  m.each do |move|
    cmd << "#{stack_name}[\"#{move['to']}\"].push(#{stack_name}[\"#{move['from']}\"].pop(#{move['move']})).flatten!"
  end
  cmd
end

lines = File.read('day05_2022.txt')

stack_hash1 = parse_stacks(lines.split("\n\n").first)
stack_hash2 = parse_stacks(lines.split("\n\n").first)

moves_sol1 = parse_moves_crate_mover9000('stack_hash1', lines.split("\n\n").last)
moves_sol1.each { |e| eval(e) }

sol_part1 = ''
stack_hash1.each_value { |value| sol_part1 += value.last }
puts "Solution part 1: #{sol_part1}"

sol_part2 = ''
moves_sol2 = parse_moves_crate_mover9001('stack_hash2', lines.split("\n\n").last)
moves_sol2.each { |e| eval(e) }
stack_hash2.each_value { |value| sol_part2 += value.last }
puts "Solution part 2: #{sol_part2}"
