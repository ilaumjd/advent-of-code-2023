total = 0
File.readlines('09in').each do |line|
  nums = line.split(' ').map(&:to_i).reverse

  seq = []
  nums.each do |num|
    next_seq = [num]
    pointer = 0
    while seq.count >= next_seq.count
      break if next_seq[pointer].zero? && seq[pointer].zero?

      next_seq << next_seq[pointer] - seq[pointer]
      pointer += 1
    end
    seq = next_seq
  end
  total += seq.sum
end

puts total
