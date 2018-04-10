# Fonction trader_du_dimanche
# Permet de retourner les jours d'achat et de revente pour maximiser les bénéfices
# Params : 
# 	array : le tableau des prix par jour
# Return : [jour où acheter, jour où vendre ]
def trader_du_dimanche(array)
	
	index_buy = 0
	index_sell = 0
	max_profit = 0

	array.each_with_index { |temp_buy_price, temp_index_buy| 
		decal = temp_index_buy +1
		array[decal..-1].each_with_index { |temp_sell_price, temp_index_sell|  
			temp_profit = temp_sell_price - temp_buy_price
			
			if temp_profit > max_profit
				max_profit = temp_profit
				index_buy = temp_index_buy
				index_sell = decal + temp_index_sell
			end
		}
	}
	return [index_buy, index_sell]
end	

def trader_du_lundi (array_of_hash)
	result = {}
	hash_enterprise_price = transposition_to_enterprise(array_of_hash)
	hash_enterprise_price.each do |enterprise,array_of_price|
		result[enterprise.to_s] = trader_du_dimanche(array_of_price)
	end
	return result
end

def transposition_to_enterprise(array_of_hash)
	result = Hash.new
	array_of_hash.each do |hash_of_day|
		hash_of_day.each do |enterprise,price|
			unless (result.has_key?(enterprise.to_s))
				array = Array.new
				result[enterprise.to_s] = array
			end
			result[enterprise.to_s].push(price)
		end
	end
	return result
end

def perform
	puts(trader_du_dimanche([17,3,6,9,15,8,6,1,10]))

	array = Array.new
	hash = { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 }
	array.push(hash)
	hash = {:GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 }
	array.push(hash)
	hash = { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 }
	array.push(hash)
	hash = { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 }
	array.push(hash)

	puts("Les prices par entreprise sont les suivantes : ")
	puts(transposition_to_enterprise(array))

	puts "Les index à suivre sont les suivants (de la forme 'nom entreprise'=>[jour d'achat, jour de revente]"
	puts trader_du_lundi(array)
end

perform