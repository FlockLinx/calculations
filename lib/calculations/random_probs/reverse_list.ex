defmodule Calculations.RandomProbs.ReverseList do
  # base case - []
  # recursive case - keep doing until list is empty

  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  def reverse2([]), do: []
  def reverse2([h | t]), do: reverse2(t) ++ [h]
end
