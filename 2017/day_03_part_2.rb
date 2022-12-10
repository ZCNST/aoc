$spiral = Array.new
$spiral << []
counter = 1
begin 
 	for i in 1..counter do
 		val = counter == 1 ? 1 : 0
 		$spiral[$spiral.count-1] << val
 	end
 	p $spiral.inspect
 	#$spiral.prepend nil 
 	for i in 1..counter do
 		val = counter == 1 ? 1 : 0
		$spiral[$spiral.count-i] << val
	end
 	counter += 1
 	for i in 1..counter do
 		val = counter == 1 ? 1 : 0
 		$spiral[0].unshift val
 	end
 	$spiral << []
	for i in 1..counter do
		val = counter == 1 ? 1 : 0
		$spiral[i-1].unshift val
 	end
 	counter += 1
end while counter < 9

$spiral.each do |ar| 
	puts ar.join("\t")
end

puts $spiral[4][4]
puts $spiral[4][5]
puts $spiral[3][5]
puts $spiral[3][4]
puts $spiral[3][3]
puts $spiral[4][3]
puts $spiral[5][3]
puts $spiral[5][4]
puts $spiral[5][5]