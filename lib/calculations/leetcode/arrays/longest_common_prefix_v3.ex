defmodule Calculations.Leetcode.Arrays.LongestCommonPrefixV3 do
  def solution(list) do
    [root | t] = list
    pref = root |> String.graphemes()
    do_max_prefix(t, pref) |> Enum.join()
  end

  def do_max_prefix([], prefix), do: prefix

  def do_max_prefix([word | t], prefix) do
    word_list = String.graphemes(word)
    newprefix = check(word_list, prefix, []) |> Enum.reverse()

    do_max_prefix(t, newprefix)
  end

  def check([], list, acc), do: acc
  def check(list, [], acc), do: acc
  def check([], [], acc), do: acc

  def check([h1 | t1], [h2 | t2], acc) do
    if h1 == h2 do
      check(t1, t2, [h2 | acc])
    else
      check([], [], acc)
    end
  end
end
