defmodule Calculations.Leetcode.TwoPointers.RemoveDuplicates do
  def solution(nums) do
    tup = List.to_tuple(nums)
    len = tuple_size(tup) - 1
    remove_duplicates(tup, len, 0, 1) |> Tuple.to_list()
  end

  def remove_duplicates(tup, len, slow, fast) when fast > len, do: tup

  def remove_duplicates(tup, len, slow, fast) do
    if elem(tup, slow) == elem(tup, fast) do
      n_tup = Tuple.delete_at(tup, fast)
      remove_duplicates(n_tup, len - 1, slow, fast)
    else
      remove_duplicates(tup, len, slow + 1, slow + 2)
    end
  end
end
