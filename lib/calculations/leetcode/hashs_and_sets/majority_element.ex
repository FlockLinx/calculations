defmodule Calculations.Leetcode.HashsAndSets.MajorityElement do
  def solution(nums) do
    map_nums = nums |> frequencies()

    {_, number} =
      Enum.reduce(map_nums, {0, 0}, fn {k, v}, {number, acc} ->
        if map_nums[k] >= number do
          {v, k}
        else
          {number, acc}
        end
      end)

    number
  end

  def frequencies(num) do
    num
    |> Enum.reduce(%{}, fn x, acc ->
      if is_nil(acc[x]) do
        Map.put(acc, x, 1)
      else
        Map.put(acc, x, acc[x] + 1)
      end
    end)
  end
end
