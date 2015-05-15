file = File.open("word_list.txt")

print "check word: "
input = gets

candidates = {}

file.each_line do |compare|
  compare.strip!
  input.strip!
  score = 0

  score += 5 if input == compare

  #Compare letters
  score += input.scan(/[#{compare}]/).size

  #Compare length
  size_diff = (input.size - compare.size).abs
  score -= size_diff

  #Compare positioning
  word_size = [input.size,compare.size].min
  word_size.times do |position|
    score += 1 if input[position] == compare[position]
  end

  candidates[compare] = score if score > 0
end

puts candidates.max_by(10) {|_,v| v}
