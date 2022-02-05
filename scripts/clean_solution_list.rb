# require_relative '../raw_data/4_reference.rb'

# words4 = []
# $words4.each do |w|
#   words4 << w[:word]
# end

# serialized_array = Marshal.dump(words4)
# File.open('app/wordlists/4_reference.txt', 'w') { |f| f.write(serialized_array) }

# four_ref = Marshal.load File.read('app/wordlists/4_reference.txt')
five_old_sol = Marshal.load File.read('app/wordlists/5_solution_original.txt')
five_new_sol = five_old_sol.map(&:itself)

five_old_sol.each do |w|
  puts "(y) to delete #{w}"
  delete = gets.chomp
  if delete == 'y'
    five_new_sol.delete(w)
  end
end

puts five_old_sol.size
puts five_new_sol.size

serialized_array = Marshal.dump(five_new_sol)
File.open('app/wordlists/tmp', 'w') { |f| f.write(serialized_array) }
