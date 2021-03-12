# Prob 7: Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given by an argument. 
# You may assume that the year is greater than 1752 (when the United Kingdom adopted the 
# modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# once a month only, need to iterate over the months over a year

# only need to check 2015-01-13, 2015-02-13, 2015-03-13 ... 2015-12-13
# how to check if those dates are fridays?
# what is 2015-01-01? then move from there

require 'date'

def friday_13th(year)

  count = 0

  1.upto(12) do |month|
    date = Date.new(year, month, 13)
    count += 1 if date.friday?
    puts month if date.friday?
  end
  count
end

# p friday_13th(2020)
# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) #== 2

