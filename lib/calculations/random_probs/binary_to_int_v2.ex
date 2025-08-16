defmodule Calculation.RandomProbs.BinaryToIntV2 do
  def solution(int) do
    b_list = String.graphemes(int)
    len = length(b_list) - 1
    rec(b_list, len, 0)
  end

  def rec([], _len, acc), do: acc
  def rec([h | t], len, acc) when h == "1", do: rec(t, len - 1, 2 ** len + acc)
  def rec([h | t], len, acc), do: rec(t, len - 1, acc)
end
