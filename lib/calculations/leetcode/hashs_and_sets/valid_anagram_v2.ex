defmodule Calculations.Leetcode.HashsAndSets.ValidAnagramV2 do
  def solution(s, t) do
    build_map(s) == build_map(t)
  end

  def build_map(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{}, fn x, acc ->
      if acc[x] == nil do
        Map.put(acc, x, 1)
      else
        Map.put(acc, x, acc[x] + 1)
      end
    end)
  end
end
