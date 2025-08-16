defmodule Calculations.RandomProbs.TwoPointers.FindMiddle do
  def solution(list) do
    tup = List.to_tuple(list)
    len = length(list)

    if is_odd?(len) do
      mfinder(tup, 0, len - 1, 0)
    else
      mfinder(tup, 1, len - 1, 0)
    end
  end

  def is_odd?(num) do
    0 != rem(num, 2)
  end

  def mfinder(tup, l, r, result) when l > r, do: result

  def mfinder(tup, l, r, result) do
    if l == r do
      mfinder(tup, l + 1, r - 1, elem(tup, r))
    else
      mfinder(tup, l + 1, r - 1, 0)
    end
  end
end

# T: O(n)
# S: O(1)
