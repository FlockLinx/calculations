defmodule Calculations.Codewars.MinimizeSum do
  def min_sum([n]), do: n
  def min_sum([]), do: []

  def min_sum(list) do
    or_list = quick_sort(list)
    rev_list = reverse(or_list, [])

    div(sum_values(or_list, rev_list, 0), 2)
  end

  def sum_values([], [], result), do: result

  def sum_values([h1 | t1], [h2 | t2], result) do
    sum_values(t1, t2, result + h1 * h2)
  end

  def quick_sort([]), do: []

  def quick_sort([h | t]) do
    left = Enum.filter(t, fn x -> x <= h end)
    right = Enum.filter(t, fn x -> x > h end)

    quick_sort(left) ++ [h] ++ quick_sort(right)
  end

  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])
end
