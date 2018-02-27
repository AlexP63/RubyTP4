#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),"..","lib"))


require 'gruff'

g = Gruff::Line.new
g.title = "Courbe de débits moyens"
File.open("pingAverage.txt").readline do |w|
	d = w.split
	g.data(":" + d[0], d[1])
end
g.write("graph.png");

puts "Le graphique comprenant les moyennes vient d'être généré !"


