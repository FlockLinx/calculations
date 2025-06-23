defmodule Calculations.RandomProbs.SumOfList do
  # base case [] - 0
  # recursive case, take h and add to sum var and return sum var at the end

  def sum_list([], nil), do: 0
  def sum_list([], sum), do: sum
  def sum_list([h | t], sum), do: sum_list(t, sum + h)
end
