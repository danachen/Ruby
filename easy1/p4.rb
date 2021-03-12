# Prob 4: How Many?

def count_occurrences(arr)

hsh = {}

  arr.each do |element|
    hsh[element] = arr.count(element)
  end

  hsh.each do |element, count|
    puts "#{element} => #{count}"
  end
end



vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)