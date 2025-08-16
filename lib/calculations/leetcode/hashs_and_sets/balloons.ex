defmodule Calculations.Leetcode.HashsAndSets.Balloons do
  def solution(text) do
    ballons_freq = map_freq("balloon")
    text_freq = map_freq(text)

    counter(text_freq, ballons_freq)
  end

  def counter(t_freq, freq) do
    Enum.map(freq, fn {k, v} ->
      div(Map.get(t_freq, k, 0), freq[k])
    end)
    |> Enum.min()
  end

  def map_freq(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{}, fn x, acc ->
      if is_nil(acc[x]) do
        Map.put(acc, x, 1)
      else
        Map.put(acc, x, acc[x] + 1)
      end
    end)
  end
end
