def stock_picker (stock_prices)
	best_buy, best_sell = 0, 0
	current_buy, current_sell = best_buy, best_sell
	best_value = stock_prices[best_sell] - stock_prices[best_buy]
	
	stock_prices.each_with_index do |price, i|
		if price < stock_prices[current_buy]
			current_buy = i
			current_sell = i
		end

		if price > stock_prices[current_sell]
			current_sell = i
		end

		if stock_prices[current_sell] - stock_prices[current_buy] > best_value
			best_buy = current_buy
			best_sell = current_sell
			best_value = stock_prices[current_sell] - stock_prices[current_buy]
		end
	end

	puts [best_buy, best_sell]

end

stock_prices = [17, 3, 5, 2, 16, 19, 10, 38, 7]
stock_picker(stock_prices)