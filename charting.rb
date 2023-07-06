#!/usr/bin/env ruby

require 'rbplotly'
require 'csv'

title = ARGV[0]
if ARGV.length < 1
  puts "Too few arguments: Title missing."
  exit 23
end

f = 'data/x-y.csv'

x = []
y = []
CSV.foreach(("#{f}") , headers: false, col_sep: " ; ") do |row|
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

