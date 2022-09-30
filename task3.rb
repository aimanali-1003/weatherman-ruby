# frozen_string_literal: true

require 'colorize'

class Task3 < Weatherman
  def month_temps
    day_temp = []
    @array_of_hashes.each do |hash|
      temp = []
      temp << if hash['GST'].nil?
                hash['PKT']
              else
                hash['GST']
              end
      temp << hash['Max TemperatureC'].to_i
      temp << hash['Min TemperatureC'].to_i
      day_temp << temp unless temp.include?(nil)
    end
    day_temp
  end

  def print_month_temps(day_temp)
    puts get_date(day_temp)
    day_temp.each.each do |day|
      date = day[0].split('-').map(&:strip)
      str = "#{date[2]} "
      (1..day[2]).each do
        str += '-'
      end
      (1..day[1]).each do
        str += '+'
      end
      str += " #{day[2]}C - #{day[1]}C"
      puts str
    end
  end

  def get_date(day_temp)
    date = day_temp[0][0].split('-').map(&:strip)
    "#{check_month(date[1])} #{date[0]}"
  end
end
