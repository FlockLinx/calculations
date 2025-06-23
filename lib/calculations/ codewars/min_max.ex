defmodule Calculations.Codewars.MinMax do
  def min([n]), do: n
  def min([h, n | t]) when h < n, do: min(t ++ [h])
  def min([_h | t]), do: min(t)

  def max([n]), do: n
  def max([h, n | t]) when h > n, do: max(t ++ [h])
  def max([_h | t]), do: max(t)
end
