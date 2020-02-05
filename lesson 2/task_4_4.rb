# task4_4
english_letter = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u']
hash_vowels = {}
english_letter.each_index do |i|
  hash_vowels[i + 1] = english_letter[i] if vowels.include?(english_letter[i])
end
puts hash_vowels
