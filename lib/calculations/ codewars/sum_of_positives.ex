defmodule Calulations.Codewars.SumOfPositives do
  # Given a list, sum all positive numbers and return
  # can solved by recursion
  # base case is [num] =  num
  # maybe can solved by using same find max strategy
  # can be solved using sum tail recursive solution
  # must add x < 0 case
  # had to use acc as auxiliar

  def positive_sum([]), do: 0
  def positive_sum([h|t]) when h > 0, do: h + positive_sum(t)
  def positive_sum([_h|t]), do: positive_sum(t)
end
