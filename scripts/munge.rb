# This script parses raw word data into wordlists used as the source for solution words
# (from the 10,000 most common English words) and reference words (legal Scrabble words).
#
########################################
# Parse reference words from raw data. #
########################################

require_relative 'raw_data/wordlist.rb'

words5 = []
$words5.each do |w|
  words5 << w[:word]
end

serialized_array = Marshal.dump(words5)
File.open('wordlists/5_reference.txt', 'w') {|f| f.write(serialized_array) }

words6 = []
$words6.each do |w|
  words6 << w[:word]
end

serialized_array = Marshal.dump(words6)
File.open('wordlists/6_reference.txt', 'w') {|f| f.write(serialized_array) }

words7 = []
$words7.each do |w|
  words7 << w[:word]
end

serialized_array = Marshal.dump(words7)
File.open('wordlists/7_reference.txt', 'w') {|f| f.write(serialized_array) }

words8 = []
$words8.each do |w|
  words8 << w[:word]
end

serialized_array = Marshal.dump(words8)
File.open('wordlists/8_reference.txt', 'w') {|f| f.write(serialized_array) }

words8 = []
$words8.each do |w|
  words8 << w[:word]
end

serialized_array = Marshal.dump(words8)
File.open('wordlists/8_reference.txt', 'w') {|f| f.write(serialized_array) }

#######################################
# Parse solution words from raw data. #
#######################################

file='raw_data/solution_list.txt'
fives = []
sixes = []
sevens = []
eights = []

File.readlines(file).each do |line|
  word = line.strip
  case word.size
  when 5
    fives << word
  when 6
    sixes << word
  when 7
    sevens << word
  when 8
    eights << word
  end
end

words5 = Marshal.load File.read('wordlists/5_reference.txt')
fives_clean = []
fives.each do |word|
 fives_clean << word if words5.include?(word)
end

words6 = Marshal.load File.read('wordlists/6_reference.txt')
sixes_clean = []
sixes.each do |word|
 sixes_clean << word if words6.include?(word)
end

words7 = Marshal.load File.read('wordlists/7_reference.txt')
sevens_clean = []
sevens.each do |word|
 sevens_clean << word if words7.include?(word)
end

words8 = Marshal.load File.read('wordlists/8_reference.txt')
eights_clean = []
eights.each do |word|
 eights_clean << word if words8.include?(word)
end

serialized_array5 = Marshal.dump(fives_clean)
File.open('wordlists/5_solution.txt', 'w') {|f| f.write(serialized_array5) }

serialized_array6 = Marshal.dump(sixes_clean)
File.open('wordlists/6_solution.txt', 'w') {|f| f.write(serialized_array6) }

serialized_array7 = Marshal.dump(sevens_clean)
File.open('wordlists/7_solution.txt', 'w') {|f| f.write(serialized_array7) }

serialized_array8 = Marshal.dump(eights_clean)
File.open('wordlists/8_solution.txt', 'w') {|f| f.write(serialized_array8) }
