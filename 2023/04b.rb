total = 0
copies = []

def increment_copies(index, inc, copies)
  if copies.count < index + 1
    copies << inc
  else
    copies[index] += inc
  end
end

File.foreach('04in').with_index do |line, index|
  increment_copies(index, 1, copies)
  card = line.gsub(/Card \d+: /, '').split(' | ').map do |numbers|
    numbers.split(' ')
  end
  same_numbers = card[0].intersection(card[1])
  (index + 1..index + same_numbers.count).each do |i|
    increment_copies(i, copies[index], copies)
  end
  total += copies[index]
end

puts total
