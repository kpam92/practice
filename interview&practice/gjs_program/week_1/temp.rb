# You are working with a team of meteorologists studying temperatures in a city. They have asked you to build a system that will track temperatures and provide metrics.
#
# Your system should provide a function `log(temperature)’ that they will call once per second to record measured temperatures, as well as functions to query their data for useful metrics. Initially, they would like to be able to know:
#
# 1) the average of all temperatures from the last 24 hours, and
# 2) the maximum temperature from the last 24 hours
#
# As an example, if the meteorologists wanted to know the maximum temperature recorded for all time, your solution might look like this:
#
# Let max = NULL
#
# Log(temperature):
#   IF max IS NULL
#     Set max = temperature
#   ELSE IF temperature > max
#     Set max = temperature
#
# GetMaxAllTime:
#   Return max


class TempRecorder

  def initialize
    @temps = []
    @max_max = [nil,nil]
    @average = nil
  end

  def log(temperature)
    if @temps.length < 86400
      @temps.push(temperature)

      if @temps.length == 1
        @max_max = [temperature, 1]
        @average = temperature
      else
        old_temperature = @temps.shift
        max_calculator(old_temperature)
        @average = ((@average * (@temps.length - 1)) + temperature) / @temps.length
      end
    else
      @temps
  end

  def average_calculator(old_temperature)
    @average = ((@average * 86400) - old temperature + @temps[-1]) * 86400
  end

  def max_calculator(temperature)
  end
end
