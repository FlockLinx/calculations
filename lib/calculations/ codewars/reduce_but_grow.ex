defmodule Calculations.Codewars.ReduceButGrow do
  # same of sum but with multiplication
  # can I solve this with recursion? - yes
  # If so, wich is the base case? - []
  # and the recursive case? take h and multiply calling the function
  def grow([n]), do: n
  def grow([h | t]), do: h * grow(t)
end
