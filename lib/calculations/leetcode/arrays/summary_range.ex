defmodule Calculations.Leetcode.SummaryRanges do
  def solution([]), do: []
  def solution([m]), do: ["#{m}"]

  def solution(nums) do
    [first | t] = nums

    rec(t, first, first, [])
  end

  def rec([], _first, _idx, counter), do: counter

  def rec([ht | tt], first, idx, counter) do
    idx = idx + 1

    cond do
      ht == idx ->
        {last, rest_list} = rec2(tt, idx)
        counter = counter ++ ["#{first}->#{last}"]

        cond do
          rest_list == [] ->
            rec([], ht, ht, counter)

          length(rest_list) == 1 ->
            [rest | _t] = rest_list
            rec([], ht, ht, counter ++ ["#{rest}"])

          true ->
            [new_f | t] = rest_list
            rec(t, new_f, new_f, counter)
        end

      tt == [] ->
        if ht == first do
          rec([], ht, ht, counter ++ ["#{first}"])
        else
          rec([], ht, ht, counter ++ ["#{first}"] ++ ["#{ht}"])
        end

      true ->
        rec(tt, ht, ht, counter ++ ["#{first}"])
    end
  end

  def rec2([hr | tr], idx) when hr == idx + 1 do
    rec2(tr, hr)
  end

  def rec2(tr, idx), do: {idx, tr}
end
