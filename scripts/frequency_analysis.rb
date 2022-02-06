require_relative '../raw_data/good_words'
require 'csv'

standard_frequencies = {
  e: 12.02,
  t: 9.1,
  a: 8.12,
  o: 7.68,
  i: 7.31,
  n: 6.95,
  s: 6.28,
  r: 6.02,
  h: 5.92,
  d: 4.32,
  l: 3.98,
  u: 2.88,
  c: 2.71,
  m: 2.61,
  f: 2.3,
  y: 2.11,
  w: 2.09,
  g: 2.03,
  p: 1.82,
  b: 1.49,
  v: 1.11,
  k: 0.69,
  x: 0.17,
  q: 0.11,
  j: 0.1,
  z: 0.07
}

a = ['e','t','a','o','i','n','s','r','h','d','l','u','c','m','f','y','w','g','p','b','v','k','x','q','j','z']
used_words = ['knoll', 'sugar', 'whack', 'mount', 'perky', 'could', 'wrung', 'light', 'moist', 'shard', 'pleat', 'aloft', 'skill']
solution_letters=$solution.join('').split('')
solution_count = solution_letters.size
used_letters = used_words.join('').split('')
used_count = used_letters.size

CSV.open('scripts/letter_frequency.csv', 'w') do |csv|
  csv << ['letter', 'standard','all','used']
  a.each do |l|
    percent_standard = standard_frequencies[l.to_sym]
    c = solution_letters.count(l)
    percent_sol = c * 100.0 / solution_count
    u = used_letters.count(l)
    percent_used = u * 100.0 / used_count
    csv << [l.upcase, percent_standard, percent_sol, percent_used]
    puts "#{l.upcase}: #{c} #{standard_frequencies[l.to_sym]} %0.2f %0.2f" % [percent_sol, percent_used]
  end
end
