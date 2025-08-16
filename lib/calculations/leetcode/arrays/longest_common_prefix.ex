defmodule Calculations.Leetcode.Arrays.LongestCommonPrefix do
  # calculate throught iteration of list itens
  # and Return the longest prefix.
  # Can solve with recursion? maybe.
  # stop recursion when find different letter
  # List? must eterate over each item?

  # ["flower", "flight", "flow"]
  # take h and 'save' the first letter and then compare with new h first letter
  def solution([root | tail]) do
    first = String.graphemes(root)

    Enum.reduce(tail, first, fn word, acc ->
      word_graphemes = String.graphemes(word)
      prex(acc, word_graphemes, []) |> Enum.reverse()
    end)
    |> Enum.join()
  end

  def prex([], _list, acc), do: acc
  def prex(_list, [], acc), do: acc

  def prex([hw | tw], [hf | tf], acc) do
    if hw == hf do
      prex(tw, tf, [hw | acc])
    else
      acc
    end
  end
end
