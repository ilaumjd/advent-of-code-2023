input = File.read('15in').chomp.split(',')

focals = {}
values = {}
boxes = []

input.each do |lens|
  lens += '0' if lens[-1] == '-'
  label = lens[0..-3]
  operation = lens[-2]
  focals[label] = lens[-1]
  unless values.key?(label)
    values[label] = label.chars.map(&:ord).inject(0) do |sum, ascii|
      ((sum + ascii) * 17) % 256
    end
  end
  box_num = values[label]
  boxes[box_num] = [] if boxes[box_num].nil?
  if boxes[box_num].include? label
    boxes[box_num] -= [label] if operation == '-'
  elsif operation == '='
    boxes[box_num] << label
  end
end

total = 0
boxes.each_with_index do |box, box_index|
  next if box.nil?

  box.each_with_index do |label, slot_index|
    total += focals[label].to_i * (slot_index + 1) * (box_index + 1)
  end
end
puts total
