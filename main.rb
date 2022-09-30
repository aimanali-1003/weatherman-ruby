# frozen_string_literal: true

load 'weatherman.rb'
load 'task1.rb'
load 'task2.rb'
load 'task3.rb'

case ARGV[0]
when '-e'
  weatherman = Task1.new
  weatherman.get_filenames(ARGV[1])
  weatherman.read_file
  weatherman.print_highest_temp(weatherman.highest_temp)
  weatherman.print_lowest_temp(weatherman.lowest_temp)
  weatherman.print_most_humidity(weatherman.most_humidity)
when '-a'
  weatherman = Task2.new
  weatherman.get_filenames(ARGV[1])
  weatherman.read_file
  weatherman.print_avg_high_temp(weatherman.avg_high_temp)
  weatherman.print_avg_lowest_temp(weatherman.avg_low_temp)
  weatherman.print_avg_humidity(weatherman.avg_humidity)

when '-c'
  weatherman = Task3.new
  weatherman.get_filenames(ARGV[1])
  weatherman.read_file
  weatherman.print_month_temps(weatherman.month_temps)
else
  puts 'Wrong input'
end
