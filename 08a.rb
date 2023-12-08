input = File.readlines('08in')

navigation = input[0].chars
navigation.pop

input.shift
input.shift

nodes = {}
input.each do |line|
  a = line.match(/(\w+) = \((\w+), (\w+)\)/)
  nodes[a[1]] = [a[2], a[3]]
end

current_node = 'AAA'
current_cursor = 0
until current_node == 'ZZZ'
  current_node = if navigation[current_cursor % navigation.count] == 'L'
                   nodes[current_node][0]
                 else
                   nodes[current_node][1]
                 end
  current_cursor += 1
end

puts current_cursor
