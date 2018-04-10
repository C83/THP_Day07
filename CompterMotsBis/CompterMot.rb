# 4.bis Compter les mots (bis)

# Google veut savoir combien de fois l'on peut trouver dans l'oeuvre intégrale de Shakespeare les mots suivants :
# dictionnary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]
# Créé un fichier shakespeare.txt qui reprend le corpus intégral de l'oeuvre de l'écrivain anglais. Ton programme va appeler le fichier shakespeare.txt (indice : c'est plus facile s'ils sont dans le même dossier), pour ensuite compter les occurences du dictionnaire.
# Après les mots communs, Google sont curieux, et veulent savoir combien il y a de gros mots dans l'oeuvre de Shakeaspeare, pour voir si l'auteur anglais était un coquin. Voici une liste de gros mots au format .txt. Télécharge ce fichier, mets-le à côté de Shakespeare.txt, 
# et trouve un moyen de transformer cette liste de mot au format txt en une array qui contient les mots convertits en string.


def jean_michel_data_for_google(file_path,dictionnary)
	corpus = get_file_as_string(file_path)
	jean_michel_data(corpus, dictionnary)
end

def jean_michel_data_with_dictionnary_from_text_for_google(file_path,dictionnary_path)
	corpus = get_file_as_string(file_path)
	dictionnary = get_file_as_string(dictionnary_path).split("\r\n")
	jean_michel_data(corpus, dictionnary)
end

def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data
end

# ##### MAIN #####
# xml_data = get_file_as_string 'Pizza.hbm.xml'
# # print out the string
# puts xml_data

def jean_michel_data (corpus, dictionnary)
	result = Hash.new(0)
	splitted_corpus = corpus.split

	splitted_corpus.each { |corpus_word|
		dictionnary.each { |dictionnary_word|
			if corpus_word.downcase.include?(dictionnary_word.downcase)
				result[dictionnary_word]+=1
			end
		}
	}
	return result
end

def perform 
	dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
	file_path = "shakespeare.txt"
	dictionnary_path = "swearWords.txt"

	puts ("Exercice 4 bis : compter mots à partir de l'oeuvre de Shakespeare")
	puts
	puts ("Le dictionnaire est le suivant : #{dictionary}")
	puts ("Le fichier de corpus est le suivant : #{file_path}")
	puts ("Compteur de mot à partir du dictionnaire : ")
	puts (jean_michel_data_for_google(file_path,dictionary))
	puts 
	puts ("Le fichier de dictionnaire est le suivant : #{dictionnary_path}")
	puts ("Le fichier de corpus est le suivant : #{file_path}")
	puts ("Compteur de mot à partir du fichier dictionnaire : ")
	puts (jean_michel_data_with_dictionnary_from_text_for_google(file_path,dictionnary_path))

end

perform