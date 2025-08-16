defmodule Calculations.Leetcode.LinkedLists.MergeTwoSortedLists do
  alias Calculations.Leetcode.LinkedLists.ListNode

  def from_list([]), do: nil
  def from_list([h | t]), do: %ListNode{val: h, next: from_list(t)}

  def to_list(nil), do: []
  def to_list(%ListNode{val: v, next: nxt}), do: [v | to_list(nxt)]

  def merge_two_lists(list1, list2) do
    l1 = to_list(list1)
    l2 = to_list(list2)
    mg_lists(l1, l2, []) |> from_list()
  end

  def mg_lists([h1 | t1], [h2 | t2], acc) do
    if h1 <= h2 do
      mg_lists(t1, [h2 | t2], acc ++ [h1])
    else
      mg_lists([h1 | t1], t2, acc ++ [h2])
    end
  end

  def mg_lists([], [], acc), do: acc
  def mg_lists(a, [], acc), do: acc ++ a
  def mg_lists([], b, acc), do: acc ++ b
end
