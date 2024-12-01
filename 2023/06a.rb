times = []
records = []
File.readlines('06in').each_with_index do |line, index|
  nums = line.split(' ')
  nums.shift
  nums.map!(&:to_i)
  if index.zero?
    times = nums
  else
    records = nums
  end
end

ways = 1
times.each_with_index do |time, index|
  record = records[index]
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
    ways *= wins
    break
  end
end

puts ways
