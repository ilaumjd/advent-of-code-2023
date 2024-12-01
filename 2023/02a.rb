color_dict = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}

total = 0
File.foreach('02in').with_index do |game, index|
  pass = true
  game.split(';').each do |set|
    color_dict.each do |color, number|
      count_each_color = set.scan(/(\d+) #{color}/).flatten[0].to_i
      if count_each_color > number 
        pass = false
        break
      end
    end
  end
  next if !pass
  total += index+1
end
puts total
