# accepts an array of prices, whose indices represent days (starting with 0)
# returns an array of the form [buy_day, sell_day], which maximizes profit
def stock_picker(prices)
	max_diffs_for_each_day = []
	second_days_for_each_max_diff = []
	# the - 1 ignores buys on the last day, which can't be sold
	# also keeps the remaining_prices range beginning from overshooting its end
	for day in (0...(prices.length - 1)) 
		remaining_prices = prices[(day + 1)...prices.length]
		max_remaining_price = remaining_prices.max
		max_diffs_for_each_day << (max_remaining_price - prices[day])
		# for tied maxes, index will return the earliest day, which we want
		# the + 1 accounts for zero-indexing of remaining_prices
		second_days_for_each_max_diff << (remaining_prices.index(max_remaining_price) + day + 1)
	end
	maxest_diff = max_diffs_for_each_day.max
	# for tied maxes, index will return the earliest day, which we want
	first_day = max_diffs_for_each_day.index(maxest_diff)
	second_day = second_days_for_each_max_diff[first_day]
	[first_day, second_day]
end

# should output [1, 5] (difference of 5 - 2 == 3)
p stock_picker([6,2,3,2,4,5,4,1])
