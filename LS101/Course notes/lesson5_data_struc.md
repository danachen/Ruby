Lesson 5: Advanced Ruby Collections (Nested Data Structure)

Referencing collection elements

```ruby
arr = [[1, 3], [2]]
arr[0] # => [1, 3]
arr[0][1] # => 3
```
Updating collection items

```ruby
arr = [[1, 3], [2]]
arr[1] = "hi there”
arr 
# => [[1, 3], "hi there"]

arr = [[1, 3], [2]]
arr[0][1] = 5
arr 
# => [[1, 5], [2]]
```
How to insert an additional element into an inner array:

```ruby
arr = [[1], [2]] 
arr[0] << 3
arr 
# => [[1, 3], [2]]
```
If we want to insert an array instead of an integer:

```ruby
arr = [[1], [2]] 
arr[0] << [3]
arr 
# => [[1, [3]], [2]]
```
Other nested structure like hash

To add a new key-value pair to the first inner hash: the change is destructive

```ruby
arr = [{ a: 'ant' }, { b: 'bear' }] 
arr[0][:c] = ‘cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```
Array can contain any kind of Ruby object: 

```ruby
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab’] 

arr[0] 
# => ["a", ["b”]]
arr[0][1][0] 
# => “b"
arr[1] 
# => { :b => "bear", :c => "cat” }
arr[1][:b] 
# => “bear"
arr[1][:b][0] 
# => “b"
arr[2][2] 
# => "b"
```

Variable reference for nested collections
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr 
# => [[1, 3], [2]]
```

Addition of variable references in nested collections
* The value of arr is changed because a still points to the same Array object that’s in arr
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr 
# => [[1, 3], [2]] 
a[1] = 5
arr 
# => [[1, 5], [2]]
```
Modifying the first array in arr is the same as modifying a directly

```ruby
arr[0][1] = 8
arr 
# => [[1, 8], [2]]
a 
# => [1, 8]
```

* This is the same as modifying a directly. In both cases, modifying object that a and arr[0] point to

Shallow Copy
* Two methods lets you copy an object, including collections, called #dup and #clone
* The objects are shared, not copied, which means any changes made to a copied version will also change the original version

```ruby
arr1 = ["a", "b", "c”]
arr2 = arr1.dup 
arr2[1].upcase! 
arr2 # => ["a", "B", “c”]
arr1 # => ["a", "B", "c”]
```

Also:

```ruby
arr1 = ["abc", "def”]
arr2 = arr1.clone 
arr2[0].reverse! 
arr2 
# => ["cba", "def”]
arr1 
# => ["cba", "def"]
```

* These results are interesting, since we would not expect the arrays themselves to be mutated
* The reason is both the #upcase! and #reverse! methods are destructive, and they refer to the objects in the array instead of the array itself
* These objects are shared, even if you mutate the object by referencing it from a particular array or other collection, it’s the object that’s affected versus the collection

Another two examples of how #dup works, compare the differences between a destructive and non-destructive method:

```ruby
arr1 = ["a", "b", "c”]
arr2 = arr1.dup 
arr2.map! do |char| 
    char.upcase 
end 

arr1 # => ["a", "b", "c”]
arr2 # => ["A", "B", "C"]

arr1 = ["a", "b", "c”]
arr2 = arr1.dup 
arr2.each do |char| 
    char.upcase!
end 
arr1 # => ["A", "B", "C”]
arr2 # => ["A", "B", "C"]
```

* Every element of arr2 is a reference to object referenced by element in arr1, then mutated method is performed on arr2, arr1 is also affected. The array elements are changed, not the array. 

What’s the difference between #clone and #dup?
* #clone preserves the frozen state of the object

```ruby
arr1 = ["a", "b", "c"].freeze 
arr2 = arr1.clone 
arr2 << “d"
# => RuntimeError: can't modify frozen Array
```
* #dup does this: arr1 is frozen, arr2 can still be modified
```
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

* #freezing is done to prevent objects from being modified
* once frozen, can’t be modified
```ruby
str = "abc".freeze 
str << “d"
# => RuntimeError: can't modify frozen String
```

* Only mutable objects can be frozen, since immutable objects like integers are already frozen
* check with #frozen method

5.frozen? # => true

* #freeze only freezes the object it’s called on
* if object it’s called on contains other objects, those objects aren’t frozen

```ruby
arr = [[1], [2], [3]].freeze 
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```

Strings in an array

```ruby
arr = ["a", "b", "c"].freeze 
arr[2] << “d"
arr # => ["a", "b", "cd"]
```
