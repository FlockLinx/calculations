defmodule Calculations.Leetcode.Arrays.GreatestCommonDivisorOfStrings do
  def gcd_of_strings(str1, str2) do
    list2 = str2 |> String.graphemes()
    list1 = str1 |> String.graphemes()
    rec(list1, list2, [])
    |> Enum.reduce(MapSet.new(), fn res, acc -> 
      if MapSet.member?(acc, res) do
        acc
      else
        MapSet.put(acc, res)
      end
    end)
    |> MapSet.to_list()
    |> List.to_string()
  end

  def rec([], list, acc), do: acc
  def rec(list, [], acc), do: acc
  def rec([h1|t1], [h2|t2], acc) when h1 == h2, do: rec(t1, t2, [h1 | acc])
  def rec([h1|t1], [h2|t2], acc), do: acc
end
