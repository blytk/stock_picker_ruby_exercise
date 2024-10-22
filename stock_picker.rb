# Implement a method #stock_picker
  # Takes an array of stock prices
  # Should return a pair of days representing the best day to buy and the best day to sell. Days start at 0
    # You need to buy before you can sell
    # Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day


# The value to sell will be selected from a sub-array of the values at index value-to-buy + 1 (we don't sell on the same day)

def stock_picker(array_of_stock_prices)
  highest_profit_stored = 0
  buy_value_index = nil
  sell_value_index = nil
  # iterate through the array
  
  array_of_stock_prices.each_with_index do |value, index1|   
    # create subarray from i + 1 till end
    subarray = array_of_stock_prices.slice(index1 + 1..-1)
    # is current value higher than first one?
    subarray.each_with_index do |element, index2|
      # if value is higher, we calculate profit and store the buy and sell value
      if element > value
        buy_value = array_of_stock_prices[index1]
        sell_value = element
        profit = sell_value - buy_value
        # if profit is better than previous ones, we store it
        if profit > highest_profit_stored
          highest_profit_stored = profit
          buy_value_index = index1
          sell_value_index = index1 + index2 + 1
        end
      end
    end
  end
  # highest profit, return indexes, print
  p "For a profit of $#{array_of_stock_prices[sell_value_index]} - $#{array_of_stock_prices[buy_value_index]} = $#{array_of_stock_prices[sell_value_index] - array_of_stock_prices[buy_value_index]}"
  return_array = [buy_value_index, sell_value_index]
  p return_array
  return_array
end

stock_picker([17,3,6,9,15,8,6,1,10])