defmodule Calculations.Leetcode.LinkedLists.ReverseList do
  alias Calculations.Leetcode.LinkedLists.ListNode

  def from_list([]), do: nil
  def from_list([h | t]), do: %ListNode{val: h, next: from_list(t)}

  def to_list(nil), do: []
  def to_list(%ListNode{val: v, next: nxt}), do: [v | to_list(nxt)]

  def reverse(list) do
    list
    |> to_list()
    |> rev([])
    |> from_list()
  end

  def rev([], acc), do: acc
  def rev([h | t], acc), do: rev(t, [h | acc])
end
