# Fonction chiffre_de_cesar
# Params : 
# 	message : le message à coder
#   nb_decal : nombre de lettre de décalage
# Return : message codé

def chiffre_de_cesar (message, nb_decal)
	result = Array.new	
	message.each_char { |chr| result.push( new_char(chr, nb_decal)) }
	return result*"" 	# Permet de retourner le tableau sous forme de string
end

# Fonction new_char
# Params : 
# 	char : le caractère à coder
#   nb : nombre de lettre de décalage
# Return : lettre codé si nécessaire
def new_char(char,nb)
	nb = nb%26					# Permet de ne pas faire des tours dans le vent
	if /^[A-Z]/ =~ char 		# On teste si c'est une lettre majuscule
		result = char.ord + nb 	# On transforme le char en valeur ASCII puis on fait le décalage 
		if result>90 			# ==A-Z  Si le décalage a dépassé Z 
			diff = result - 90	# On voit de combien on a dépassé Z
			result = 64 + diff	# La différence est réutilisé à partir de A
		end
		char = result.chr 		# On repasse du code ASCII au caractère

	elsif /^[a-z]/ =~ char 		# On teste si c'est une lettre minuscule. 
	# Même principe pour les minuscules 
		result = char.ord + nb 
		if result>122 	#==z
			diff = result - 122
			result = 96 + diff
		end	
		char = result.chr 		
	end 						# Si ce n'est ni une minuscule, ni majuscule, on ne fait rien
	return char
end

def ask_parameters
	puts "Quel est le message à coder ?"
	message = gets.chomp
	puts "De combien de lettres sera le décalage ?"
	decal = gets.chomp.to_i
	return message, decal
end

def perform 
	puts ("Exercice 2 : chiffrement de César")
	puts
	puts("Pour 'What a string!', le résultat est : ")
	puts chiffre_de_cesar("What a string!", 5) 
	puts 

	# Pour que l'utilisateur teste son codage de César 
	message,nb_decal = ask_parameters
	puts chiffre_de_cesar( message,nb_decal )
end

perform

# "A".ord #=> 65 
# 65.chr #=> A