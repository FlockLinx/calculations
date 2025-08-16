defmodule Calculations.Leetcode.MergeSortedLists do
  def solution(l1, l2) do
    tup1 = List.to_tuple(l1)
    tup2 = List.to_tuple(l2)
    ln1 = tuple_size(tup1)
    ln2 = tuple_size(tup2)
    len = ln1 + ln2
    merge_tups(tup1, tup2, ln1 - 1, ln2 - 1, 0, 0, len, [])
  end

  def merge_tups({}, t2, ln1, ln2, _, _, _, list), do: list ++ Tuple.to_list(t2)
  def merge_tups(t1, {}, ln1, ln2, _, _, _, list), do: list ++ Tuple.to_list(t1)
  def merge_tups(t1, t2, ln1, ln2, p1, p2, len, list) when len == 0, do: list

  def merge_tups(t1, t2, ln1, ln2, p1, p2, len, list) do
    cond do
      p1 <= ln1 && p2 <= ln2 && elem(t1, p1) < elem(t2, p2) ->
        merge_tups(t1, t2, ln1, ln2, p1 + 1, p2, len - 1, list ++ [elem(t1, p1)])

      p1 <= ln1 && p2 <= ln2 && elem(t1, p1) > elem(t2, p2) ->
        merge_tups(t1, t2, ln1, ln2, p1, p2 + 1, len - 1, list ++ [elem(t2, p2)])

      p1 > ln1 && p2 < ln2 ->
        merge_tups(t1, t2, ln1, ln2, p1, p2 + 1, len - 1, list ++ [elem(t2, p2)])

      p1 < ln1 && p2 > ln2 ->
        merge_tups(t1, t2, ln1, ln2, p1 + 1, p2, len - 1, list ++ [elem(t1, p1)])

      p1 == ln1 ->
        merge_tups(t1, t2, ln1, ln2, p1 + 1, p2, len - 1, list ++ [elem(t1, p1)])

      p2 == ln2 ->
        merge_tups(t1, t2, ln1, ln2, p1, p2 + 1, len - 1, list ++ [elem(t2, p2)])
    end
  end
end
