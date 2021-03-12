# Prob one: Madlibs Revisited

# I want the data structure to be: 
# hsh = { :verb => [v1, v2, v3]; :adjectives => [a1, a2, a3], etc}
# each symbol is identified as the word preceding :, and every word after is the key value in an
# array, separated by ,
# how to take a string of text, and force them into a data structure

hsh = {}

file = File.open('p1.txt', 'r') 

puts file.strip