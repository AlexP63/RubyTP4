#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),"..","lib"))

##Test si le fichier est donné en paramètres
if(ARGV.empty?)
	puts "Use : ruby rfortune filePaths"
end

contenu = ""
##Split de la/des string(s) et affichage d'une fortune
ARGV.each do |path|
contenu += File.read(path)
end

puts contenu.split('%').sample

