defmodule Calculations.Codewars.NextItemFromList do
  # Given a list and item list return next item
  #  Its a list so its a Enumerable
  #  check if item is present on the list
  #  how to know the next item?
  #   Maybe list with index can be a solution
  #   or something with count and size to iterate x + 1 times
  #   can be made with tail recursion
  # my try
  # def next_item(list, item) do
  # [_h | t] = list
  # [h, n | _t] = list

  # if h == item do
  #   next_item(n, item)
  # else
  #   next_item(t, item)
  # end
  # end

  def next_item([], _item), do: nil
  def next_item([_], _item), do: nil
  # match is maded here, compare item with head
  def next_item([item, next | _tail], item), do: next
  def next_item([_head | tail], item), do: next_item(tail, item)
end
