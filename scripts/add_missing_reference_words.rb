reference_words = Marshal.load File.read('app/wordlists/5_reference.txt')
comparison_words = Marshal.load File.read('app/wordlists/5_reference_old.txt')
size_before = reference_words.size
puts "Reverence word count before: #{size_before}"

comparison_words.each do |w|
  if !reference_words.include?(w)
    reference_words << w
    puts "#{w} was added"
  end
end

puts "Reverence word count before: #{size_before}"
puts "Reverence word count after: #{reference_words.size}"

serialized_array = Marshal.dump(reference_words)
File.open('app/wordlists/5_reference.txt', 'w') { |f| f.write(serialized_array) }
