module Enumerable
  def accumulate
    new_arr = []

    if block_given?
      self.each do |el|
        new_arr << yield(el)
      end
    else 
      new_arr = to_enum :accumulate
    end
    new_arr
  end
end