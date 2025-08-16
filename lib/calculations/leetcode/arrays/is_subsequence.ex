defmodule Calculations.Leetcode.Arrays.IsSubsequence do
  def solution("", _t), do: true
  def solution(t, t), do: true

  def solution(s, t) do
    sl = String.graphemes(s)
    tl = String.graphemes(t)

    compare_seq(sl, tl, 0)
  end

  def compare_seq([], _list, acc) when acc > 0, do: true
  def compare_seq(list, [], _acc), do: false
  def compare_seq([], _list, acc) when acc == 0, do: false

  def compare_seq([hs | ts], [ht | tt], acc) do
    if hs == ht do
      compare_seq(ts, tt, acc + 1)
    else
      compare_seq([hs | ts], tt, acc)
    end
  end
end
