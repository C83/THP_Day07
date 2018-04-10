# 4. Compter les mots
# 

# Fonction jean_michel_data
# Params : 
# 	  le corpus, un string dans lequel tu devras checker le nombre d'occurence de différents strings
#     le dictionnaire, une array de mots pour qui tu vas compter les occurences dans le corpus
# Result : 
# 	  Hash avec nombre d'occurence des mots
#

def jean_michel_data (corpus, dictionnaire)
	
	result = Hash.new(0) 	# On met la valeur par défaut à 0 si la clé n'existe pas. 
	splitted_corpus = corpus.split

	# boucle dans boucle 
	splitted_corpus.each { |corpus_word|
		dictionnaire.each { |dictionnary_word|
			if corpus_word.downcase.include?(dictionnary_word.downcase)
				# Ne pas faire l'inverse : on veut que la condition soit vraie
				# même si le mot du dictionnaire est en partie dans le mot du corpus
				result[dictionnary_word]+=1		# Je rajoute 1 à la valeur de la clé dictionnaire_word
			end
		}
	}
	return result
end

# > dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
# > jean_michel_data("below", dictionary)
# => {"below"=>1, "low"=>1}
# > jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)
# => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}

def perform 
	dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

	puts ("Exercice 4 : compter mots")
	puts
	puts ("Le dictionnaire est le suivant : #{dictionary}")
	puts ("Résultat avec 'below' : ")
	puts (jean_michel_data("below", dictionary))
	puts ("Pour la phrase 'Howdy partner, sit down! How's it going?'")
	puts (jean_michel_data("Howdy partner, sit down! How's it going?", dictionary))
	
end

perform