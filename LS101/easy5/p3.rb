# Prob 3: After Midnight (Part 2)

# Write two methods that each take a time of day in 24 hour format, 
# and return the number of minutes before and after midnight, respectively. 
# Both methods should return a value in the range 0..1439.
# This is the reverse of the last problem

MINUTES_IN_A_DAY = 24 * 60
HOURS_IN_A_DAY = 24
MINUTES_IN_AN_HOUR = 60

def after_midnight(time)

  hour = time[0..1].to_i
  min = time[3..4].to_i

  revised_time = (hour * MINUTES_IN_AN_HOUR + min) % MINUTES_IN_A_DAY
end

def before_midnight(time)

  (MINUTES_IN_A_DAY - after_midnight(time)) % MINUTES_IN_A_DAY

end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0