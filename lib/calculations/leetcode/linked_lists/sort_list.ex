defmodule Calculations.Leetcode.LinkedLists.SortList do
  alias Calculations.Leetcode.LinkedLists.ListNode

  def sort_list(head) do
    head
    |> to_list()
    |> qsort()
    |> from_list()
  end

  def from_list([]), do: nil
  def from_list([h | t]), do: from_list(%ListNode{val: h, next: from_list(t)})

  def to_list(nil), do: []
  def to_list(%ListNode{val: v, next: nxt}), do: [v | to_list(nxt)]

  def qsort([]), do: []

  def qsort([h | t]) do
    left = Enum.filter(t, fn x -> x < h end)
    right = Enum.filter(t, fn x -> x >= h end)

    qsort(left) ++ [h] ++ qsort(right)
  end
end
