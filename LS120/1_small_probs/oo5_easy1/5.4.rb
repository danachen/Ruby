# Fix the Program - Books (Part 2)

# can use %() instead of " " when "" is already in use in the sentence


class Book
  
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new     
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}"" is #{book.author}.)
puts %(book = #{book}.)


# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.