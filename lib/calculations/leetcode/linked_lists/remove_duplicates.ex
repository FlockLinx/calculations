defmodule Calculations.Leetcode.LinkedLists.RemoveDuplicates do
  alias Calculations.Leetcode.LinkedLists.ListNode

  def from_list([]), do: nil
  def from_list([h | t]), do: %ListNode{val: h, next: from_list(t)}

  def nto_list(nil), do: []
  def nto_list(%ListNode{val: v, next: nxt}), do: [v | nto_list(nxt)]

  def delete_duplicates(head) do
    head
    |> nto_list()
    |> remove_duplicates(MapSet.new())
    |> MapSet.to_list()
    |> Enum.sort()
    |> from_list()
  end

  def remove_duplicates([], acc), do: acc

  def remove_duplicates([h | t], acc) do
    if MapSet.member?(acc, h) do
      remove_duplicates(t, acc)
    else
      remove_duplicates(t, MapSet.put(acc, h))
    end
  end
end
