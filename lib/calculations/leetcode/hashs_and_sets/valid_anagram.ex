defmodule Calculations.Leetcode.HashsAndSets.ValidAnagram do
  def solution(word1, word2) do
    str1 = word1 |> String.to_charlist() |> Enum.sort()
    str2 = word2 |> String.to_charlist() |> Enum.sort()

    str1 == str2
  end
end
