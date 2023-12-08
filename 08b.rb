input = File.readlines('08exb')

navigation = input[0].chars
navigation.pop

input.shift
input.shift

nodes = {}
input.each do |line|
  a = line.match(/(\w+) = \((\w+), (\w+)\)/)
  nodes[a[1]] = [a[2], a[3]]
end

current_nodes = nodes.keys.filter { |key| key[2] == 'A' }

lcm = 1
current_nodes.each do |current_node|
  current_cursor = 0
  until current_node[2] == 'Z'
    current_node = if navigation[current_cursor % navigation.count] == 'L'
                     nodes[current_node][0]
                   else
                     nodes[current_node][1]
                   end
    current_cursor += 1
  end
  lcm = current_cursor.lcm(lcm)
end

puts lcm
