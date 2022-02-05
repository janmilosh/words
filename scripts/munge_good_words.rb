require_relative '../raw_data/good_words.rb'

serialized_array = Marshal.dump($solution)
File.open('app/wordlists/5_solution.txt', 'w') {|f| f.write(serialized_array) }

serialized_array = Marshal.dump($reference)
File.open('app/wordlists/5_reference.txt', 'w') {|f| f.write(serialized_array) }
