def stock_picker(prices) 
  buy_price = prices[0]
  profit = 0

  prices[1..].each do |price|
    if buy_price > price
        buy_price = price
    end
    profit = [profit, price - buy_price].max
end
profit
end

puts stock_picker([17,3,6,9,15,8,6,1,10])