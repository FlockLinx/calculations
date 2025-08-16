defmodule Calculations.Leetcode.HashsAndSets.TwoSumV2 do
  def solution(nums, target) do
    map_nums = turn_to_map(nums)

    Enum.reduce_while(map_nums, nil, fn {k1, _v1}, _nil ->
      n_nums = Map.delete(map_nums, k1)

      result =
        Enum.reduce_while(n_nums, [], fn {k2, _v1}, acc2 ->
          if(map_nums[k1] + n_nums[k2] == target) do
            {:halt, [k1, k2 | acc2]}
          else
            {:cont, acc2}
          end
        end)

      if result == [] do
        {:cont, []}
      else
        {:halt, result}
      end
    end)
  end

  def turn_to_map(nums) do
    {map, _} =
      Enum.reduce(nums, {%{}, -1}, fn x, {acc, counter} ->
        {Map.put(acc, counter + 1, x), counter + 1}
      end)

    map
  end
end
