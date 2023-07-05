#!/usr/bin/env ruby

# Basic Bar Chart
require 'rbplotly'
require 'csv'

f = 'data/x-y.csv'

x = []
y = []
CSV.foreach(("#{f}") , headers: false, col_sep: " ; ") do |row|
  x << row[0]
  y << row[1]
end 

#puts x
#puts y

trace = { 
  x: x,
  y: y,
  type: :line
}

plot = Plotly::Plot.new(data: [trace])
plot.generate_html(path: './chart.html')
