defmodule Calculations.Leetcode.Arrays.BuyAndSell do
  # Must keep the values of min_price (best buy) and max_profit
  # very handy built in funcs max and min 
  # Input prices = [7,1,5,3,6,4]
  # Output 5 -> 6 - 1
  # keep it simple

  def solution(prices) do
    [min_price | _t] = prices
    rec(prices, min_price, 0)
  end

  def rec([], min_price, max_profit), do: max_profit

  def rec([price | t], min_price, max_profit) do
    min_price = min(min_price, price)
    profit = price - min_price
    max_profit = max(max_profit, profit)
    rec(t, min_price, max_profit)
  end
end
