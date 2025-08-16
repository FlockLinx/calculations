defmodule Calculations.Leetcode.Arrays.TwoSum do
  # solution must be O(n)
  # traverse array only one time
  # use map
  # use complement - target

  def solution(nums, target) do
    Enum.reduce_while(nums, {%{}, 0}, fn num, {map, index} ->
      comp = target - num

      if Map.has_key?(map, comp) do
        {:halt, [Map.get(map, comp), index]}
      else
        {:cont, {Map.put(map, num, index), index + 1}}
      end
    end)
  end
end
