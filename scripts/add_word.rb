solution_words = Marshal.load File.read('app/wordlists/5_solution.txt')
reference_words = Marshal.load File.read('app/wordlists/5_reference.txt')

puts 'Enter word to add.'
word = gets.chomp.downcase

valid = reference_words.include?(word)
new_word = !solution_words.include?(word)

puts "#{word} isn't valid." unless valid
puts "#{word} is already in the solution list." unless new_word

if valid && new_word
  puts "#{word} has been added to the solution list."
  solution_words << word
  serialized_array = Marshal.dump(solution_words)
  File.open('app/wordlists/5_solution.txt', 'w') { |f| f.write(serialized_array) }
end
