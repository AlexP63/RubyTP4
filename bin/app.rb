#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),"..","lib"))

require 'date'

def lectureDesTemps
	##Récupération d'arguments : ETAPE 1

	if ARGV.empty? 
		puts "Use : ruby app.rb serverIP"
	end	

	i = 0
	arr = Array.new()	

	ARGV.each do |arg|
		IO.popen("ping #{arg}") do |tube|
			tube.each_line do |line|
				if !line.nil? 
					rep = /\btime=\K\d*.?\d*/.match(line).to_s.strip.to_i
					arr.push(rep)
					i=i+1
					puts "valeur de i : #{i}"	
					if i > 5
						arr.shift 
						return arr
					end	
				end
			end
		end
	end
	
	##Récupération du temps uniquement : ETAPE 2
		
end

def moyenne(arr)
	arr.reduce(0) do |acc, val| acc += val end.to_f / arr.size
end

res = lectureDesTemps
puts "Le résultat est #{res}"

puts "La moyenne est de #{moyenne(res)}"

f = File.new("pingAverage.txt","a")
f.puts("#{DateTime.now} #{moyenne(res)}")

puts "Ecriture dans pingAverage.txt terminée !" 

