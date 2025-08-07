defmodule Calculations.Leetcode.Arrays.ProductArrayExeceptSelf do
  def solution([m]), do: [m]

  def solution(nums) do
    [first | tl] = nums
    len = length(nums)
    rec(tl, nums, len, first, [])
  end

  def rec([], nums, 0, multiplier, acc), do: acc

  def rec([], nums, 1, multiplier, acc) do
    new_list = List.delete(nums, multiplier)
    value = Enum.reduce(new_list, 1, fn x, acc2 -> x * acc2 end)
    rec([], nums, 0, multiplier, [value | acc])
  end

  def rec(tl, nums, len, multiplier, acc) do
    [next | tt] = tl

    new_list = List.delete(nums, multiplier)
    value = Enum.reduce(new_list, 1, fn x, acc2 -> x * acc2 end)
    rec(tt, nums, len - 1, next, [value | acc])
  end

  def solutionv2(nums) do
    nums
    |> multiply_left()
    |> multiply_right(nums)
  end

  def multiply_left(nums) do
    Enum.reduce(nums, {[], 1}, fn x, {acc, prod} ->
      {[prod | acc], x * prod}
    end)
    |> elem(0)
    |> Enum.reverse()
  end

  def multiply_right(left_values, nums) do
    Enum.reverse(nums)
    |> Enum.reduce({[], 1}, fn y, {acc, prod} ->
      [left | rest] = left_values
      {[left * prod | acc], y * prod}
    end)
    |> elem(0)
  end
end
