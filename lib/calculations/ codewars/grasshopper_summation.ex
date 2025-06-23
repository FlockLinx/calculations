defmodule Calculations.Codewars.GrasshopperSummation do
  # can I solve this with recurstion? yes
  # so which is the base case? when n == 0 return n
  # recursive case, take n and sum with n-1 until 0

  def summation(n) when n == 0, do: n
  def summation(n), do: n + summation(n - 1)
end
