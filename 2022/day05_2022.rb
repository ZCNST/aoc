# frozen_string_literal: true

# [V]     [B]                     [C]
# [C]     [N] [G]         [W]     [P]
# [W]     [C] [Q] [S]     [C]     [M]
# [L]     [W] [B] [Z]     [F] [S] [V]
# [R]     [G] [H] [F] [P] [V] [M] [T]
# [M] [L] [R] [D] [L] [N] [P] [D] [W]
# [F] [Q] [S] [C] [G] [G] [Z] [P] [N]
# [Q] [D] [P] [L] [V] [D] [D] [C] [Z]
#  1   2   3   4   5   6   7   8   9

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

solution_p1 = ''
stack_hash1.each_value { |value| solution_p1 += value.last }
p solution_p1

moves_sol2 = parse_moves_crate_mover9001('stack_hash2', lines.split("\n\n").last)
moves_sol2.each { |e| eval(e) }

solution_p2 = ''
stack_hash2.each_value { |value| solution_p2 += value.last }
p solution_p2
