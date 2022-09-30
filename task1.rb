# frozen_string_literal: true

class Task1 < Weatherman
  def get_hash_values(hash, str)
    temp = []
    temp << hash[str].to_i
    temp << if hash['GST'].nil?
              hash['PKT']
            else
              hash['GST']
            end
    temp
  end

  def highest_temp
    max = []
    @array_of_hashes.each do |hash|
      temp = get_hash_values(hash, 'Max TemperatureC')
      max << temp unless temp.include?(nil)
    end
    max.max
  end

  def lowest_temp
    min = []
    @array_of_hashes.each do |hash|
      temp = get_hash_values(hash, 'Min TemperatureC')
      min << temp if temp[0].to_i != 0 && !temp.include?(nil)
    end
    min.min
  end

  def most_humidity
    max = []
    @array_of_hashes.each do |hash|
      temp = get_hash_values(hash, 'Max Humidity')
      max << temp unless temp.include?(nil)
    end
    max.max
  end

  def print_highest_temp(max)
    date = max[1].split('-').map(&:strip)
    puts "Highest: #{max[0]}C on #{check_month(date[1])} #{date[2]}"
  end

  def print_lowest_temp(min)
    date = min[1].split('-').map(&:strip)
    puts "Lowest: #{min[0]}C on #{check_month(date[1])} #{date[2]}"
  end

  def print_most_humidity(max)
    date = max[1].split('-').map(&:strip)
    puts "Humidity: #{max[0]}% on #{check_month(date[1])} #{date[2]}"
  end
end
