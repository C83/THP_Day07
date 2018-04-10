# On cherche la somme des multiples de 3 et 5 inférieurs à 1 000
def sum_of_multiple(nb) 		# On défini une fonction : somme des multiples avec pour paramètre un nombre
	result = 0					# On initialise à O
	nb.times { |n| 
		if (n%3==0) or (n%5==0)	# Test : si le nombre est divisé par 3 OU 5, le modulo retourne un reste nul
			result += n 		# Dans ce cas, c'est un multiple de 3 OU de 5, on le rajoute à la somme générale
		end
	}
	return result
end

def ask_number
	puts "Jusqu'à combien voulez-vous aller	? "
  	number_receive = gets.chomp.to_i	#  on propose d'entrer un nombre que l'on va utiliser sans saut de ligne, c'est un nombre entier
	return number_receive
end

def perform

	puts ("Exercice 1 : Somme des multiples de 3 et 5")
	puts("Pour 1000, le résultat est : ")
	puts(sum_of_multiple(1000).to_i)
	
	# Il est aussi possible de proposer son propre chiffre
	puts (sum_of_multiple(ask_number))

end


perform