solution_words = Marshal.load File.read('app/wordlists/5_solution.txt')

puts 'Enter word to remove.'
word = gets.chomp.downcase

valid = solution_words.include?(word)

puts "#{word} isn't in list." unless valid

if valid
  puts "#{word} has been removed from the solution list."
  solution_words.delete(word)
  serialized_array = Marshal.dump(solution_words)
  File.open('app/wordlists/5_solution.txt', 'w') { |f| f.write(serialized_array) }
end
