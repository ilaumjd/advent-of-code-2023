
total = 0
File.foreach('02in').with_index do |game, index|
  color_dict = {
    'red' => 0,
    'green' => 0,
    'blue' => 0
  }
  game.split(';').each do |set|
    color_dict.each do |color, number|
      count_each_color = set.scan(/(\d+) #{color}/).flatten[0].to_i
      if count_each_color > number 
        color_dict[color] = count_each_color
      end
    end
  end
  multipilied = 1
  color_dict.each do |color, number|
    multipilied *= number
  end
  total += multipilied
end
puts total
