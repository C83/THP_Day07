def sum_of_multiple(nb)
	result = 0
	nb.times { |n| 
		if (n%3==0) or (n%5==0)
			result += n
		end
	}
	return result
end

def ask_number
	puts "Jusqu'à combien voulez-vous aller	? "
  	number_receive = gets.chomp.to_i
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