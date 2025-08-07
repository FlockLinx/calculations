defmodule Calculations.Codewars.ArrayLeaders do
  def array_leaders(nums) do
    nums
    |> leaders([])
    |> reverse([])
  end

  def leaders([0], acc), do: acc
  def leaders([n], acc) when n < 0, do: acc
  def leaders([], acc), do: acc

  def leaders([h | t], acc) do
    if h > sum_list(t, 0) do
      leaders(t, [h | acc])
    else
      leaders(t, acc)
    end
  end

  def sum_list([], 0), do: 0
  def sum_list([], acc), do: acc
  def sum_list([h | t], acc), do: sum_list(t, acc + h)

  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])
end
