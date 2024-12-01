patterns = File.read('13in').split(/\n\s*\n/)

def find_reflection_line(rows)
  line_indexes = rows.map.with_index { |_, index| rows[index] == rows[index + 1] ? index : -1 } - [-1]
  line_indexes.each do |index|
    count = 1
    loop do
      low = index - count
      high = index + count + 1

      return index + 1 if low.negative? || high >= rows.count

      break if rows[low] != rows[high]

      count += 1
    end
  end
  -1
end

total = 0
patterns.each do |pattern|
  rows = pattern.lines.map(&:chomp)
  row_index = find_reflection_line(rows)

  if row_index.positive?
    total += row_index * 100
  else
    columns = rows[0].chars.each_index.map { |index| rows.map { |row| row[index] }.join }
    column_index = find_reflection_line(columns)
    total += column_index if column_index.positive?
  end
end
puts total
