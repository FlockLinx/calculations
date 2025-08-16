defmodule Calculations.RandomProbs.TwoPointers.IsPalindrome do
  def check?(string) do
    tup =
      string
      |> String.graphemes()
      |> List.to_tuple()

    do_check(tup, 0, tuple_size(tup) - 1)
  end

  def do_check(tup, left, right) when left >= right, do: true

  def do_check(tup, left, right) do
    if elem(tup, left) != elem(tup, right) do
      false
    else
      do_check(tup, left + 1, right - 1)
    end
  end
end
