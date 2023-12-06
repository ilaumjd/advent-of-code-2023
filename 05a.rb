input = File.readlines('05in')
input.select! { |line| line.index('map').nil? }

seeds = input.shift.split(' ')
seeds.shift
seeds.map!(&:to_i)

steps = []
input.each do |line|
  map = line.split(' ')
  if map.count != 3
    steps << []
  else
    map.map!(&:to_i)
    steps.last << map
  end
end

lowest = 999_999_999
seeds.each_with_index do |seed, _index|
  steps.each do |step|
    step.each do |map|
      source = map[1]
      range = map[2]
      next unless seed >= source && seed < source + range

      seed += map[0] - source
      break
    end
  end
  lowest = seed if seed < lowest
end
puts lowest
