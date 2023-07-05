#!/usr/bin/env ruby

require 'rbplotly'

x = [0, 1, 2, 3, 4]
trace0 = { x: x, y: [0, 2, 1, 4, 3], type: :scatter, mode: :lines }
trace1 = { x: x, y: [4, 1, 3, 0, 2], type: :scatter, mode: :'markers+lines' }
data = [trace0, trace1] # data must be an array

layout = { width: 500, height: 500 }

plot = Plotly::Plot.new(data: data, layout: layout)

plot.layout.height = 300 # You can assign plot's attributes.

# If your env has web browser
plot.generate_html(path: './line_chart.html')
