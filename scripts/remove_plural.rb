require_relative '../raw_data/4_reference.rb'

words4 = []
$words4.each do |w|
  words4 << w[:word]
end

serialized_array = Marshal.dump(words4)
File.open('app/wordlists/4_reference.txt', 'w') { |f| f.write(serialized_array) }

four_ref = Marshal.load File.read('app/wordlists/4_reference.txt')
five_old_sol = Marshal.load File.read('app/wordlists/5_solution_old.txt')

five_old_sol.each do |w|
  if w.slice(4) == 's'
    substr = w.slice(0..3)
    if four_ref.include?(substr)
      five_sol_copy.delete(w)
    end
  end
end

serialized_array = Marshal.dump(five_sol_copy)
File.open('app/wordlists/5_solution.txt', 'w') { |f| f.write(serialized_array) }
