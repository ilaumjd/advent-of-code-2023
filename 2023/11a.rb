input = File.readlines('11in').map(&:chomp).map(&:chars)

galaxies = []
input.each_with_index do |line, i|
  line.each_with_index do |char, j|
    galaxies << [i, j] if char == '#'
  end
end

empty_row = []
input.each_with_index { |line, index| empty_row << index unless line.include? '#' }

empty_column = []
input[0].each_with_index do |_, index|
  empty_column << index unless (0..input.count - 1).map do |column|
                                 input[column][index]
                               end.include? '#'
end

total = 0
(0..galaxies.count - 2).each do |i|
  (i + 1..galaxies.count - 1).each do |j|
    x = [galaxies[i][0], galaxies[j][0]].sort
    y = [galaxies[i][1], galaxies[j][1]].sort
    total += x[1] - x[0] + y[1] - y[0]
    total += ((x[0]..x[1]).to_a.intersection empty_row).count
    total += ((y[0]..y[1]).to_a.intersection empty_column).count
  end
end
puts total
