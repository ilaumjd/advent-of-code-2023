total = 0

File.foreach('04in') do |line|
  card = line.gsub(/Card \d+: /, '').split(' | ').map do |numbers|
    numbers.split(' ')
  end
  same_numbers = card[0].intersection(card[1])
  total += 2**(same_numbers.count - 1) unless same_numbers.empty?
end

puts total
