#!/usr/bin/env ruby

require 'rbplotly'
require 'csv'
require 'colorize'
require 'optparse'


myname = File.basename(__FILE__)
options = {}
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: #{myname} [options]"

  options[:t] = nil
  opts.on('-t', '--title TITLE', 'Plot-title.') do |x|
    options[:t] = x
  end

  options[:p] = nil
  opts.on('-p', '--programname NAME', 'What are u looking for.') do |pr|
    options[:p] = pr
  end

end
optparse.parse!


if options[:t].nil?
  puts "need a title for your plot".red
  puts optparse
  exit 1
end
title = options[:t].to_s


if options[:p].nil?
  puts "need a programname to look for.".red
  puts optparse
  exit 1
end
programName = options[:p].to_s

$data_files = 'data/runcmd*.csv'
$csv_file = 'data/x-y.csv'


p title
p programName


class Preprocessor

  def cleaner_to_datafiles(name_of_program)
    puts "writing clean data-file, looking for \"#{name_of_program}\""
    # grep -i $programm runcmd_202?-*.csv |sed 's/ //g' > ${programm}.data
    
    # array for lines:
    hits = []

    # 1) glob files
    Dir.glob($data_files).each do |datafile| 
      # 2) loop through files and get lines:
      c = 0
      File.open(datafile) do |f|
        f.each_line do |line|
          c = c + 1
          if line.to_s.include? "#{name_of_program}"
            puts "#{line}"
            # save line to array:
            hits.push(line)
          end
        end
        f.close
      end
      puts "#{c} lines searched in #{datafile}".yellow
    end
    # write name_of_program.data:
    df = File.open("data/#{name_of_program}.data", "w")
    hits.each do |l|
      df.write("#{l}")
    end
    df.close

  end

  
  def generate_data_points_to_csv
    puts "writing datapoints to a csv-like file"
    # grep $programm ${programm}.data |  sed 's/t(s)://g' | awk -F';' '{print $2 " ; " $6  }' > x-y.csv
  end

end





clean = Preprocessor.new
clean.cleaner_to_datafiles programName 

gen = Preprocessor.new
gen.generate_data_points_to_csv


exit 0










x = []
y = []
CSV.foreach(("#{$csv_file}") , headers: false, col_sep: " ; ") do |row|
  x << row[0]
  y << row[1]
end

#puts x
#puts y

trace1 = {
  x: x,
  y: y,
  type: :scatter, mode: :'markers+lines',
}

plot = Plotly::Plot.new(data: [trace1])
plot.layout.title = "#{title}"
plot.generate_html(path: "./#{title}_plot.html")

