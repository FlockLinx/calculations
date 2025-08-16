defmodule Calculations.RandomProbs.PairSum do
  def solution(list, target) do
    map_l = MapSet.new(list)

    true ==
      Enum.reduce_while(list, false, fn x, acc ->
        if MapSet.member?(map_l, target - x) && target - x != x do
          {:halt, true}
        else
          {:cont, acc}
        end
      end)
  end

  def most_freq_word(phrase) do
    lphrase = String.split(phrase)
    mapped_ph = mapping(lphrase)

    {_, top_freq} =
      Enum.reduce(mapped_ph, {0, ""}, fn {word, _freq}, {acc, most_freq} ->
        if mapped_ph[word] >= acc do
          {mapped_ph[word], word}
        else
          {acc, most_freq}
        end
      end)

    top_freq
  end

  def mapping(list) do
    Enum.reduce(list, %{}, fn x, acc ->
      if is_nil(acc[x]) do
        Map.put(acc, x, 1)
      else
        Map.put(acc, x, acc[x] + 1)
      end
    end)
  end
end
