defmodule Calculations.Grokking.Cap4.CountListItems do
  def count_items([], acc \\ 0), do: acc
  def count_items([h | t], acc), do: count_items(t, acc + 1)
end
