def to_card_num(card)
  case card
  when 'T'
    10
  when 'J'
    11
  when 'Q'
    12
  when 'K'
    13
  when 'A'
    14
  else
    card.to_i
  end
end

hands = []
File.readlines('07in').each do |line|
  hand = line.split(' ')

  cards = hand[0].chars
  uniq = cards.uniq

  type = case uniq.count
         when 5
           0
         when 4
           1
         when 3
           uniq.any? { |card| cards.count(card) == 3 } ? 3 : 2
         when 2
           uniq.any? { |card| cards.count(card) == 4 } ? 5 : 4
         when 1
           6
         end

  cards.map! { |card| to_card_num(card) }

  hands << [cards, type, hand[1].to_i]
end

hands.sort_by! { |hand| [hand[1], hand[0]].flatten }

puts hands.each_with_index.reduce(0) { |acc, (hand, index)| acc + hand[2] * (index + 1) }
