defmodule Calculations.HashsAndSets.ContainsDuplicate do
  def solution(nums) do
    true ==
      Enum.reduce_while(nums, MapSet.new(), fn n, set ->
        if MapSet.member?(set, n) do
          {:halt, true}
        else
          {:cont, MapSet.put(set, n)}
        end
      end)
  end
end
