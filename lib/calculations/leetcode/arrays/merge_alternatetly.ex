defmodule Calculations.Leetcode.Arrays.MergeAlternatetly do
  def solution(word1, word2) do
    list1 = String.graphemes(word1)
    list2 = String.graphemes(word2)
    for x <- merge_list(list1, list2), into: "", do: x
  end

  def merge_list([], [], l3 \\ []), do: l3
  def merge_list([h1 | t1], [], l3), do: merge_list(t1, [], l3 ++ [h1])
  def merge_list([], [h2 | t2], l3), do: merge_list([], t2, l3 ++ [h2])

  def merge_list([h1 | t1], [h2 | t2], l3) do
    merge_list(t1, t2, l3 ++ [h1] ++ [h2])
  end
end
