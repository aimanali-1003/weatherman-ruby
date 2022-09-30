# frozen_string_literal: true

require 'date'

class Weatherman
  def initialize
    @filenames = []
    @array_of_hashes = []
  end

  def get_filenames(str)
    if str.include?('/')
      str = str.split('/').map(&:strip)
      year = str[0]
      mon = check_month(str[1])
      @filenames = Dir.glob("**#{ARGV[2]}/**#{year}_#{mon}**")

    else
      @filenames = Dir.glob("**#{ARGV[2]}/**#{str}**")
    end
  end

  def read_file
    @filenames.each do |filename|
      file = File.open(filename)
      columns = get_columns(file)
      until file.eof?
        hash_of_day = {}
        data = file.readline.split(',').map(&:strip)
        columns.each do |col|
          hash_of_day[col] = data[columns.index(col)]
        end
        @array_of_hashes << hash_of_day
      end
    end
  end

  def get_columns(file)
    columns = file.readline.split(',').map(&:strip)

    columns = file.readline.split(',').map(&:strip) if columns.include? ''

    columns
    # puts columns
  end

  def check_month(num)
    Date::ABBR_MONTHNAMES[num.to_i]
  end
end
