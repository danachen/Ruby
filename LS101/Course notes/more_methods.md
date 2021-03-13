Lesson 4: More Methods

Example 1: Enumerable#any?

In Ruby, Array and Hash includes the Enumerable module
```ruby
[1, 2, 3].any? do |num| 
  num > 2
end                # => true
```
* We need to be aware of the return value of the method and the return value of the block
* any? looks at the truthiness of block’s return value, to see what the method’s return value will be
* If block returns truthy value for any element in collection, method will return true

any? can also be used with a hash. Block requires two parameters to access key and value.
```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value| 
  value.size > 4
end
# => false
```

Example 2: Enumerable#all?

all? looks at the truthiness of the block’s return value, method only returns true if block’s return value in every iteration is truthy (not false or nil)
```ruby
[1, 2, 3].all? do |num| 
  num > 2
end
# => false
```
all? on a hash
```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value| 
  value.length >= 3
end
# => true
```

Example 3: Enumerable#each_with_index on array

* nearly identical to #each, while both takes a block and executes the code within the block, block’s return value is ignored
* unlike #each, #each_with_index takes a second argument to represent the the index of each element

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts “The index of #{num} is #{index}.”
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
```
Example 4: Enumerable#each_with_index on a hash

```ruby
{ a: “ant”, b: “bear”, c: “cat” }.each_with_index do |pair, index|
  puts “The index of #{pair} is #{index}.”
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
```
* the first argument now represents an array containing both the key and the value
* #each_with_index always returns the original calling collection

Example 5: Enumerable#each_with_object in an array

* each_with_object takes a method argument
* method argument is a collection object that will be returned by the method
* the block also takes 2 more arguments
* first block argument represents the current element, second block argument represents the collection object that’s passed in as an argument to method
* once done iterating, method returns collection object passed in

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
```
* here, array is initialised to an empty array [  ] inside the block. Inside the block, we can manipulate the array. 
* append the current num if it’s odd

Example 5: Enumerable#each_with_object in a hash

* similar to each_with_index, first block argument turns into array when invoking each_with_object hash

```ruby
{ a: “ant”, b: “bear”, c: “cat” }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => [“ant”, “bear”, “cat”]
```
* it’s possible to use parentheses to capture the key and value in the first block argument
```ruby
{ a: “ant”, b: “bear”, c: “cat” }.each_with_object([]) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

Example 6: Enumerable#first

* #first doesn’t take a block, but takes an optional argument that represents the number of elements to return
* when no argument is given, returns only first element in collection
```ruby
[1, 2, 3].first
# => 1
```
* when argument is provided, first returns specified number of elements
```ruby
{ a: “ant”, b: “bear”, c: “cat” }.first(2)
# => [[:a, “ant”], [:b, “bear”]]
```
To note:
1. Hashes are unordered, values are retrieved by keys. Order is preserved according to the order of insertion.
2. #first is typically not called on a hash, but on an array. Return value of calling first on a hash with a numeric argument is a nested array. Turning it back into a hash can be done with [[:a, “ant”], [:b, “bear”]].to_h

Example 7: Enumerable#include?

* #include? doesn’t take a block, requires one argument. Returns true if argument exists in collection and false if not.
```ruby
[1, 2, 3]. include?(1)
# => true
```
When called on a hash, include? only checks keys, not values
```ruby
{ a: "ant", b: "bear", c: "cat" }.include?("ant”)
# => false 

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
```
* Hash#include is an alias for Hash#key? or Hash#has_key?
* those are actually preferred over Hash#include to make intention more explicit

* if want to know if a value exists in a hash, use Hash#value? or Hash#has_value? methods, such as hash.has_value?(‘cat’)
* these are better than calling the Hash#value and then chaining include?, like hash.values.include?(‘cat’)

Example 8: Enumerable#partition

* partition divides elements in two collections, depending on return value
```ruby
[1, 2, 3].partition do |num| 
  num.odd?
end
# => [[1, 3], [2]]
```
* return value is a nested array
* inner arrays separated based on return value of block
* best way is to parallel assign variables to capture divided inner arrays
```ruby
odd, even = [1, 2, 3].partition do |num| 
  num.odd?
end 
odd # => [1, 3]
even # => [2]
```
* even if collection is hash, return value of partition will always be array
```ruby
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value| 
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
```
* to transform back to hash, invoke Array#to_h
```ruby
long.to_h # => { :b => "bear” }
short.to_h # => { :a => "ant", :c => "cat" }
```
Things to look for when reading a method’s documentation:
* Whether method takes a block
* How it handles block’s return value
* What the method itself returns