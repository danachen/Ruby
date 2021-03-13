# Prob one: Cute angles

# Write a method that takes a floating point number that represents an angle 
# between 0 and 360 degrees and returns a String that represents that angle in degrees, 
# minutes and seconds. You should use a degree symbol (°) to represent degrees, 
# a single quote (') to represent minutes, and a double quote (") to represent seconds. 
# A degree has 60 minutes, while a minute has 60 seconds.


# try calculating with 93.034773, 93 is the degree, .034773*60 = 2,08638, 0,08638 * 60 = 5

# DEGREE = "\xC2\xB0"

# def dms(degree)
#   hour = degree.to_i
#   minute_float = (degree - hour) * 60
#   minute = minute_float.to_i
#   second = ((minute_float - minute)*60).to_i

#   output =''
#   output = "%(#{hour.to_s}°#{minute.to_s}'#{second.to_s}\")"
# end


# A good solution

DEGREE = "\xC2\xB0"

def dms(float)
  degrees, minutes = (float * 60 * 60).divmod(60*60)
  minutes, seconds = minutes.divmod(60)
    puts degrees, minutes, seconds

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")