defmodule Calculations.Leetcode.Recursion.MergeSortedLists do
  # def merge_two_lists(list1, list2) do
  # merge_lists(list1, list2, [])
  # end

  def merge_lists([], [], acc), do: acc
  def merge_lists([a], [], acc), do: acc ++ [a]
  def merge_lists([], [b], acc), do: acc ++ [b]

  def merge_lists([h1 | t1], [h2 | t2], acc) do
    merge_lists(t1, t2, acc ++ [h1] ++ [h2])
  end

  def merge_two_lists(list1, list2) do
    mg_lists(list1, list2, [])
  end

  def mg_lists([], [], acc), do: acc
  def mg_lists([a], [], acc), do: acc ++ [a]
  def mg_lists([], [b], acc), do: acc ++ [b]

  def mg_lists([h1 | t1], [h2 | t2], acc) do
    mg_lists(t1, t2, acc ++ [h1] ++ [h2])
  end
end
