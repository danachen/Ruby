# Prob 2: After Midnight (Part 1)

# The time of day can be represented as the number of minutes before or after midnight. 
# If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns 
# the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# represent the time in 00:00 format, have to find a way to convert output into this format
# how to convert the times to before or after midnight
# a day has 24 hours x 60 minutes per hour
# the minutes can be easily converted to hours with this constant
# other constants: 60 minutes in an hour
# 24 hours in a day
# first get the time within a 24 hour period
# then convert to a clockwise rotation
# then calculate the hour and minute
# then format it in the way required

MINUTES_IN_A_DAY = 24 * 60
HOURS_IN_A_DAY = 24
MINUTES_IN_AN_HOUR = 60

def time_of_day(min)

  minutes_revised = min % MINUTES_IN_A_DAY

  hours, minutes = minutes_revised.divmod(MINUTES_IN_AN_HOUR)

  hours.to_s + ':' + minutes.to_s

end

# p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29"

# what I'm missing
  format('%02d:%02d', hours, minutes)

  format('%02d:%02d', hours, minutes)



