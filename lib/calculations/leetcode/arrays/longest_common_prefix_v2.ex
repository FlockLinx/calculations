defmodule Calculations.Leetcode.Arrays.LongestCommonPrefixV2 do
  def solution(strs) do
    [h | t] = strs
    compare_list = String.graphemes(h)
    leng = length(t)

    rec(compare_list, t, leng, 0, [])
    |> reverse([])
    |> to_string()
  end

  def rec([], words_list, leng, trim_pos, prefix), do: prefix

  def rec([letter | tcomp], words_list, leng, trim_pos, prefix) do
    if leng == rec2(letter, words_list, trim_pos, 0) do
      trim_pos = trim_pos + 1
      rec(tcomp, words_list, leng, trim_pos, [letter | prefix])
    else
      rec([], words_list, leng, trim_pos, prefix)
    end
  end

  def rec2(letter, [], trim_pos, counter), do: counter

  def rec2(letter, [hw | tw], trim_pos, counter) do
    head_list = hw |> String.slice(trim_pos..-1//1) |> String.graphemes()

    if head_list == [] do
      rec2(letter, [], trim_pos, counter)
    else
      [hl | _tl] = head_list

      if letter == hl do
        counter = counter + 1
        rec2(letter, tw, trim_pos, counter)
      else
        rec2(letter, tw, trim_pos, counter)
      end
    end
  end

  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])
end
