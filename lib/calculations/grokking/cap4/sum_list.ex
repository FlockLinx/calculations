defmodule Calculations.Grokking.Cap4.SumList do
  def list_sum([]), do: 0
  def list_sum([n]), do: n
  def list_sum([h | t]), do: h + list_sum(t)
end
