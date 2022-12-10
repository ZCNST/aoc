# frozen_string_literal: true

head_motions = File.read('day09_2022.txt')
                   .split("\n")
                   .map { |m| m.split(' ') }
                   .map { |e| { e.first => e.last.to_i } }

head_places = [{ x: 0, y: 0 }]
tail_places = [{ x: 0, y: 0 }]

knots = []
10.times { knots << [{ x: 0, y: 0 }] }

head_motions.each do |mov|
  mov.values.first.times do
    head_places << case mov.keys.first
                   when 'R'
                     { x: head_places.last[:x] + 1, y: head_places.last[:y] }
                   when 'L'
                     { x: head_places.last[:x] - 1, y: head_places.last[:y] }
                   when 'U'
                     { x: head_places.last[:x], y: head_places.last[:y] + 1 }
                   when 'D'
                     { x: head_places.last[:x], y: head_places.last[:y] - 1 }
                   else
                     p 'this never happen'
                     raise
                   end

    # part 1
    tail_places << if (head_places.last[:x] - tail_places.last[:x]).abs > 1 ||
                      (head_places.last[:y] - tail_places.last[:y]).abs > 1
                     head_places[-2]
                   else
                     tail_places.last
                   end

    # part 2
    knots[0] << head_places.last

    (1..9).each do |i|
      delta_x = knots[i - 1].last[:x] - knots[i].last[:x]
      delta_y = knots[i - 1].last[:y] - knots[i].last[:y]

      x = knots[i].last[:x]
      y = knots[i].last[:y]

      if delta_x.abs > 1 && delta_y.abs.positive? || delta_x.abs.positive? && delta_y.abs > 1
        x = delta_x.positive? ? x + 1 : x - 1
        y = delta_y.positive? ? y + 1 : y - 1
      elsif delta_x.abs > 1
        x = delta_x.positive? ? x + 1 : x - 1
      elsif delta_y.abs > 1
        y = delta_y.positive? ? y + 1 : y - 1
      end

      knots[i] << { x: x, y: y }
    end
  end
end

puts "Solution part 1: #{tail_places.map(&:values).uniq.size}"
puts "Solution part 2: #{knots.last.map(&:values).uniq.size}"
