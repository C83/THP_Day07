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
	result = Hash.new(0)
	splitted_corpus = corpus.split

	splitted_corpus.each { |corpus_word|
		dictionnaire.each { |dictionnary_word|
			if corpus_word.downcase.include?(dictionnary_word.downcase)
				result[dictionnary_word]+=1
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