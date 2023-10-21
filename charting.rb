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
  opts.on('-t ', '--title', 'Plot title.') do |x|
    options[:t] = x
  end
end
optparse.parse!


if options[:t].nil?
  puts optparse
  exit 1
end
title = options[:t].to_s




















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

