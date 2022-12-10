

# Riceve un array di due parole appartenenti alla stessa passphrase
# Per il day uno basta verificare che array[0] != array[1]
def check_not_anagram(array)
	# Qui prendo le due parole, le divido in array di caratteri 
	# Ordino entrambi gli array di caratteri in ordine alfabetico
	# Infine, verifico che le due parole siano diverse
	return array[0].chars.sort.join != array[1].chars.sort.join
end


valid_passphrase_counter = 0
File.open('dayfour.txt').each do |passphrase|
	passphrase_valid = true
	
	# Prendo tutte le combinazioni di 2 parole che formano la passphrase sotto esame
	passphrase.split(" ").combination(2).to_a.each do |e|
		passphrase_valid = passphrase_valid && check_not_anagram(e) 
	end

	# Se la passphrase è valida, incremento il contatore
	valid_passphrase_counter += 1 if passphrase_valid
end

puts valid_passphrase_counter