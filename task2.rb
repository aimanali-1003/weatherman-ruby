# frozen_string_literal: true

class Task2 < Weatherman
  def avg(str)
    avg = []
    @array_of_hashes.each do |hash|
      temp = hash[str].to_i
      avg << temp unless temp.nil?
    end
    avg.inject(0.0) { |sum, el| sum + el } / avg.size
  end

  def avg_high_temp
    avg('Max TemperatureC')
  end

  def avg_low_temp
    avg('Min TemperatureC')
  end

  def avg_humidity
    avg('Mean Humidity')
  end

  def print_avg_high_temp(num)
    puts "Highest Average: #{num.round(2)}C"
  end

  def print_avg_lowest_temp(num)
    puts "Lowest Average: #{num.round(2)}C"
  end

  def print_avg_humidity(num)
    puts "Average Humidity: #{num.round}%"
  end
end
