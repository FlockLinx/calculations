defmodule Calculations.Codewars.DescendingOrder do 
  def descending_order(0), do: 0
  def descending_order(n) do 
    str = for x <- qdesc_sort(number_to_list(n, [])), into: "", do: to_string(x)
    String.to_integer(str)
  end

  def number_to_list(0, acc), do: acc
  def number_to_list(n, acc) do
    acc = [rem(n, 10)| acc]
    number_to_list(div(n, 10), acc)
  end

  def qdesc_sort([]), do: []
  def qdesc_sort([h|t]) do
    minor = Enum.filter(t, fn x -> x <= h end)
    greater = Enum.filter(t, fn x -> x > h end)

    qdesc_sort(greater) ++ [h] ++ qdesc_sort(minor)
  end
end
