defmodule Calculations.RandomProbs.TwoPointers.ReverseString do
  def reverse(list), do: do_reverse(list, [], [])

  def do_reverse([], left_acc, right_acc), do: right_acc ++ left_acc

  def do_reverse([h | t], left_acc, right_acc) do
    do_reverse(t, left_acc, [h | right_acc])
  end
end
