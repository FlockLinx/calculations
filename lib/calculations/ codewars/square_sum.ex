defmodule Calculations.Codewars.SquareSum do
  # can I solve with recursion? - yes
  # base case -  [] 
  # recursive case - take head and multiply and then call same func with tail until empty list  
  def square_sum([]), do: 0
  def square_sum([h | t]), do: h * h + square_sum(t)
end
