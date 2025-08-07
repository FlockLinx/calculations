defmodule Calculations.RandomProbs.BinaryToInt do
  # input its string
  def solution(binary_num) do
    binary_list = String.graphemes(binary_num)
    len = length(binary_list)

    counter(binary_list, len - 1, 0)
  end

  def counter([], _len, acc), do: acc
  def counter([h | t], len, acc) when h == "1", do: counter(t, len - 1, 2 ** len + acc)
  def counter([h | t], len, acc), do: counter(t, len - 1, acc)
end

# ['1','0','1', '1']
#  [2ˆ3, 2ˆ2, 2ˆ1, 2ˆ0]
