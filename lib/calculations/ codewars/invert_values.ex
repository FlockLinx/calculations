defmodule Calculations.Codewars.InvertValues do
  def invert(list, inverted_list \\ [])
  def invert([], inverted_list), do: inverted_list

  def invert([h | t], inverted_list) do
    reverse(invert(t, [h * -1 | inverted_list]))
  end

  def reverse(list, reversed \\ [])
  def reverse([], reversed), do: reversed
  def reverse([h | t], reversed), do: reverse(t, [h | reversed])
end
