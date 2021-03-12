Working with collections and popular collection methods

* Collections: string, array, hash
* Collection methods: each, map, select

Core knowledge (shown in examples)
* Lesson 4 (no built-in methods): To know how to implement looping structures for strings and hashes, that iterates, maps (both mutating and non-mutating) and select over the data structure. It also shows taking more than one method arguments. This is without using the built-in methods.
    * The key is to understand that with a loop, you need 4 elements:
        * A loop
        * A way to break out of the loop
        * A way to retrieve current value
        * And a counter
        * For selection and transformation, a bonus need for some criteria
* Notice the selection and transformation criteria could be based on the value, the index, or hash key
* The process is always the same if you are selecting or performing a transformation
    * A new variable to hold the new data structure (if not mutating the current values)
    * A counter, and the counter increments
    * A way to break out of the loop (typically on top of the loop to prevent counter getting trapped if the size of input is 0), typically when it finishes iterating over the entire input data
    * A way to capture the value of the current round of iteration, typically by placing the value in a new variable
    * This is a one step process in the case of string/array, but two step for hash, since it typically wants to access the access based on a  key. In this case, pull the key value out of the iteration through counter, and then pull the value out through pinpointing it via a key
    * To perform selection, use an if structure, that transfers a true condition to a new data variable if a certain condition is satisfied
    * And always return the new data structure at bottom of the method
    

* Lesson 4 (methods): 

1. Why does #each method returns what it does
* #each is the method called on an array. The method takes a block, do … end, and the code within the block is executed for each iteration. The code within the block determines what is outputted. For each iteration, each sends the value of the current element to the block in the form of an argument. Argument of the block represents the value of the current element in the array.
2. How does the #each method work with a hash?
* Hash needs two arguments to represent both key and value per iteration, so the block will have two arguments.
3. What is the different between the return value of a loop and that of #each?
* #each always returns the original collection after iterating, where a loop might very well return nil if the last argument was a puts 
4. How does the last expression within a method influence its return value?
* The method always returns the last expression within the method. Therefore, if a puts statement is put in after a method that iterates (such as #each), then the method will return nil.
5. How does the #select method work?
* Select evaluates the return value of the block. The block returns a value on each iteration, and is evaluated by #select. The return value of the block is the return value of the last expression within the block. #select also only cares about the truthiness of the block’s return value. If truthy, then will be selected, otherwise not.
* If the expression evaluated by select is not an explicitly ? expression, for example, n+1, then it’s always considered truthy, and all the elements are selected (only nil and false are considered falsey). 
* Similar to the #each example, if a puts statement is evaluated as the last expression in the block, then that becomes evaluated as the last expression and will always return nil. nil is a falsey value, and will result in no elements selected.
6. Explain how the #map method works
* #map uses return value of the block to perform transformation instead of selection
* #map will always return the transformed selection
* What if the instruction does not ask for a transformation, but say a selection? Then the returned value will be true or false based on how the arguments are assessed. The original array is transformed to an array of true/false values
* a) #map will always perform transformations based on the return value of block, even if the return values are boolean
* b) similar to above, if the last argument processed is puts, then #map will return a transformed array of nils (since puts will return nil).  Unlike #select, where nil evaluates to falsey and results in an empty array, and #each, where the return value is just nil, map will return an array of nils.
* c) if the only statement in the block is something like ‘hi’, then #map will return an array where each element is ‘hi’, since #map will always use the return value of the block as the transformation criteria - thus whatever is in the block will get transformed
7. Where do you find Enumerables? 
* Array and Hash each has an #each method
* #select and #map are defined in Enumerables and made available to Array and Hash classes
* can always split a String and access those methods
8. Compare the return value, returned collection and size of collection of the #each, #select, and #map methods.
* How does each method treat the return value of the block? 
    * #each does not care about the return value of the block at all, and will always return the original collection
    * #map cares about the return value of the block, and will use the return value as the criteria for the transformation
    * #select cares about the truthiness of the return value, and will only return a selection that is considered truthy
* What does the length of the returned collection look like?
    * #map and #each will always return the size of the original collection
    * #select will return same or less

* Lesson 4 (more methods from the Enumerable class): 
1. Both the #any? and #all? methods return true or false
2. #each_with_index, just like #each, ignores the return value of the block and returns the original calling collection, whether it’s array or hash
3. #each_with_object (see example below)
* Takes a method argument, a method argument is a collection object that will be returned by the method
* Array is initialized to an empty array inside the block. Inside the block, array can be manipulated. The number is appended to the array if it’s odd. 
* The block then takes two more arguments. First block represents the current element, second represents collection object that’s passed in as an argument to the method. 
* Once done iterating, method returns collection object passed in.

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
    array << num if num.odd?
end
# => [1, 3]
```

Example of using #each_with_index and #each_with_object on a hash, where first argument turns into array.

1. #each_with_index
```ruby
{ a: “ant”, b: “bear”, c: “cat”}.each_with_index do |pair, index|
puts “The index of #{pair} is #{index}."
end
# => The index of [:a, “ant”] is 0.
# => The index of [:b, “bear”] is 1.
# => The index of [:c, “cat”] is 2.
# => { :a => “ant”,  :b => “bear”, :c => “cat” }
```

2.  #each_with_object

```ruby
{ a: “ant”, b: “bear”, c: “cat”}.each_with_object([]) do |pair, array|
array << pair.last
end
# => [“ant”, “bear”, “cat”]
```

*  In this case, block argument turns into array when invoking this hash
* This is an excellent post with examples of how to [use this method](https://womanonrails.com/each-with-object), typically with arrays and hash, where an array and hash should be returned
* This is also excellent in explaining when to use each_with_object, and when to use #reduce

3. #each_with_object and capturing both key and value in the first block argument

```ruby
{ a: “ant”, b: “bear”, c: “cat”}.each_with_object({}) do |(key, value), hash|
hash[value] = key
end
# => [“ant” => :a, “bear” => :b, “cat” => :c]
```

* Note the return values: 1 is the original array of a hash, since #each_with_index operates the same way as #each in terms of return values
* 2 the return value is the object declared in the method argument, which in this case is an array
* 3 returns the object declared in the method argument, which is a hash, and the block argument also captures the properties of a hash, with key and values both represented

* #first, does not take a block but an optional argument that represents the number of elements to return, works with both array and hash
    * typically called on an array, but also works on a hash. The return value is always a nested array, and can be turned back into a has with #to_h
* #include? also takes no block, but requires one argument, returns true if argument exists, false if not
* when called on hash, this only checks keys, not values. Hash#include = Hash#key? or Hash#has_key?
* if looking for a value in a hash, use Hash#value? or Hash#has_value?, e.g. `hash.has_value?(‘cat’)`

Examples: 

```ruby
{ a: “ant”, b: “bear”, c: “cat”}.include?(“ant”)
#=> false

{ a: “ant”, b: “bear”, c: “cat”}.include?(:a)
#=> true
```
* The use of #partition, which divides elements into two collections depending on return value
* Return value is a nested array, and inner arrays are separated based on return value of block
* Can also parallel assign variables to capture divided inner arrays
* Even if collection is hash, return value always array, can always transform back to hash by #to_h

```
[1, 2, 3].partition do |num|
num.odd?
end
# => [[1,3,], [2]]

odd, even = [1, 2, 3].partition do |num|
    num.odd?
end
odd # => [1, 3]
even # => [2]

long, short = { a: “ant”, b: “bear”, c: “cat”}.partition do |key, value|
    value.size > 3
end
# => [[:bear, “bear”]], [[:a, “ant”], [:c, “cat”]]
```
