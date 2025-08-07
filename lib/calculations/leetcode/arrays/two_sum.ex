defmodule Calculations.Leetcode.Arrays.TwoSum do
  #  def solution(nums, target) do
  # for {idx, value} <- list_to_map(nums) do
  #   if (value - taget) in Map.values(nums) do
  #     nums
  #   else
  #     nums
  #   end
  # end
  # end

  def list_to_map(nums) do
    for {value, index} <- Enum.with_index(nums), into: %{} do
      {index, value}
    end
  end
end
