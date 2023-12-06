time = 0
record = 0
File.readlines('06in').each_with_index do |line, index|
  num = line.delete(' ').split(':')[1].to_i
  if index.zero?
    time = num
  else
    record = num
  end
end

bottom = 0
top = time

loop do
  mid = (top + bottom) / 2

  distance = mid * (time - mid)
  if distance > record
    bottom = mid
  else
    top = mid
  end

  next unless bottom + 1 == top

  loses = (time - bottom) * 2
  wins = time - loses + 1
  puts wins
  break
end
