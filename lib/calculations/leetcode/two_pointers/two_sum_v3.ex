defmodule Calculations.Leetcode.TwoPointers.TwoSumV3 do
  def check(nums, target) do
    tup = List.to_tuple(nums)
    len = tuple_size(tup)

    solution(tup, 0, 1, target, len)
  end

  def solution(tup, slow, fast, target, len) when fast >= len,
    do: solution(tup, slow + 1, slow + 2, target, len)

  def solution(tup, slow, fast, target, len) do
    if elem(tup, slow) + elem(tup, fast) == target do
      [slow, fast]
    else
      solution(tup, slow, fast + 1, target, len)
    end
  end
end
