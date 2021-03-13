def transform(input)
  return '' if input.empty?
  new_arr = input.split(/ |\./).reject {|i| i.empty?}
  new_arr.map.with_index {|word, idx| idx.odd? ? word.reverse : word }.join(' ') + '.'
end

p transform("") # => ""
p transform(".") # => "."
p transform("hello") # => "hello"
p transform("hello world.") # => "hello dlrow."
p transform("hello world .") # => "hello dlrow."
p transform("hello  world .") # => "hello dlrow."
p transform("hello world  .") # => "hello dlrow."
p transform("hello word world .") # => "hello drow world."