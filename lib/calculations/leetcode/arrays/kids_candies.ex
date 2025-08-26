defmodule Calculations.Leetcode.Arrays.KidsCandies do
  def solution(candies, extra_candies) do
    maxc = find_max(candies)
    
    candies
    |> update_list(extra_candies, [])
    |> check_greatest(maxc, [])
  end

  def find_max([n]), do: n
  def find_max([h, n|t]) when h > n, do: find_max([h|t])
  def find_max([h, n|t]), do: find_max([n|t])

  def update_list([], _, acc), do: acc
  def update_list([h|t], val, acc), do: update_list(t, val, [h+val| acc])

  def check_greatest([], max_value, acc), do: acc
  def check_greatest([h|t], max_value, acc) when h >= max_value, do: check_greatest(t, max_value, [true | acc])
  def check_greatest([h|t], max_value, acc), do: check_greatest(t, max_value, [false| acc])
end
