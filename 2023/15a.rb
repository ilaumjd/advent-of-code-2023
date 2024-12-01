input = File.read('15in').chomp.split(',').map { |string| string.chars.map(&:ord) }

total = input.reduce(0) do |sum, asciis|
  sum + asciis.inject(0) do |sum, ascii|
    ((sum + ascii) * 17) % 256
  end
end
puts total
