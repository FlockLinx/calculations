defmodule CalulationsLeetcodeArrays do
  # can be solved with recursion
  # base case nums == [] return nil
  # recursive case elem + nums[head]
  # until nums == []

  @spec running_sum(nums :: [integer]) :: [integer]
  def recursive_call([nil]), do: []
  def recursive_call([]), do: 0

  def running_sum(nums) do
    recursive_call(nums)
  end

  def recursive_call([h | t]) do
    [h] ++ [h + recursive_call(t)]
  end

  # fail with recursion
  # its much easier using iteration for
end
