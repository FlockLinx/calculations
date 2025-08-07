defmodule Calculations.Leetcode.HashsAndSetsi.JewelsAndStores do
  def solution(jewels, stones) do
    ljewels = String.graphemes(jewels)
    lstones = String.graphemes(stones)
    rec(ljewels, lstones, 0)
  end

  def rec([], _stones, scounter), do: scounter

  def rec([hj | tj], stones, scounter) do
    {rest, cont_l} =
      Enum.reduce(stones, {0, []}, fn s, {acc, list} ->
        if hj == s do
          {acc + 1, [hj | list]}
        else
          {acc, list}
        end
      end)

    new_list = remove_list(stones, cont_l)
    rec(tj, new_list, scounter + rest)
  end

  def remove_list(stones, []), do: stones

  def remove_list(stones, [h | t]) do
    List.delete(stones, h) |> remove_list(t)
  end
end
