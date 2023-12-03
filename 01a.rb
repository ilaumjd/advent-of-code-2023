total = 0
File.foreach('01in') do |line|
  numbers = line.scan(/\d/)
  total += (numbers[0] + numbers[-1]).to_i
end
puts total
