defmodule Calculations.Leetcode.HashsAndSets.RansomNode do
  def solution(ransom, magazine) do
    ran = string_map(ransom)
    mag = string_map(magazine)

    false != verify_qqt(ran, mag)
  end

  def verify_qqt(ran, mag) do
    ran
    |> Enum.reduce_while(0, fn {k, v}, acc ->
      if mag[k] == nil || ran[k] <= mag[k] do
        {:halt, false}
      else
        {:cont, 0}
      end
    end)
  end

  def string_map(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{}, fn x, acc ->
      if acc[x] != nil do
        Map.put(acc, x, acc[x] + 1)
      else
        Map.put(acc, x, 1)
      end
    end)
  end
end
