# frozen_string_literal: true

lines = File.read('day02_2022.txt')

# A for Rock, B for Paper, and C for Scissors.
# X for Rock, Y for Paper, and Z for Scissors.
# 1 for Rock, 2 for Paper, and 3 for Scissors

part_one = {
  A: { # rock
    X: 1 + 3, # rock + draw
    Y: 2 + 6, # paper + win
    Z: 3 + 0 # scissors + lose
  },
  B: { # paper
    X: 1 + 0, # rock + lose
    Y: 2 + 3, # paper + draw
    Z: 3 + 6 # scissors + win
  },

  C: { # scissors
    X: 1 + 6, # rock + win
    Y: 2 + 0, # paper + lose
    Z: 3 + 3 # scissors + draw
  }
}

# A for Rock, B for Paper, and C for Scissors.
# X for lose, Y for draw, and Z for win.
# 1 for Rock, 2 for Paper, and 3 for Scissors

part_two = {
  A: { # rock
    X: 3 + 0, # scissors + lose
    Y: 1 + 3, # rock + draw
    Z: 2 + 6 # paper + win
  },
  B: { # paper
    X: 1 + 0, # rock + lose
    Y: 2 + 3, # paper + draw
    Z: 3 + 6 # scissor + win
  },

  C: { # scissors
    X: 2 + 0, # paper + lose
    Y: 3 + 3, # scissor + draw
    Z: 1 + 6 # rock + win
  }
}

score_p1 = 0
score_p2 = 0

lines.split("\n").each do |round|
  score_p1 += part_one[round.split[0].to_sym][round.split[1].to_sym]
  score_p2 += part_two[round.split[0].to_sym][round.split[1].to_sym]
end

puts "Solution day 2 part 1 = #{score_p1}"
puts "Solution day 2 part 1 = #{score_p2}"
