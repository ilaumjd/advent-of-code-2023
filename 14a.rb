rows = File.readlines('14in').map(&:chomp)
columns = rows[0].chars.each_index.map { |index| rows.map { |row| row[index] } }

total = 0
columns.each do |column|
  rocks = column.map.with_index { |char, index| char == '#' ? column.count - index : char } - ['.']
  value = column.count
  rocks.each do |rock|
    if rock == 'O'
      total += value
      value -= 1
    else
      value = rock - 1
    end
  end
end
puts total
