input = File.readlines('12in').map(&:split)

def generate_possibility(index, wilds, springs)
  if index == wilds.count - 1
    tail = springs[wilds[index] + 1..]
    return [['.'] + tail, ['#'] + tail]
  end
  possible = []
  tails = generate_possibility(index + 1, wilds, springs)
  tails.each do |tail|
    a = springs[wilds[index] + 1..wilds[index + 1] - 1] + tail
    possible << ['.'] + a
    possible << ['#'] + a
  end
  possible
end

total = 0
input.each do |line|
  springs = line[0].chars
  damaged_index = line[1].split(',').map(&:to_i)

  wilds = springs.map.with_index { |char, index| char == '?' ? index : -1 }.reject { |index| index == -1 }
  generate_possibility(0, wilds, springs).each do |spring|
    spring = springs[0..wilds[0] - 1] + spring if wilds[0] != 0
    total += 1 if spring.join.split('.').delete_if(&:empty?).map(&:size) == damaged_index
  end
end
puts total
