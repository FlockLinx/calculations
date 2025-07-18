defmodule Calculations.Leetcode.Arrays.ClosestToZero do
  def solution([h | t]) do
    Enum.reduce(t, h, fn current, acc ->
      cond do
        abs(current) < abs(acc) -> current
        abs(current) > abs(acc) -> acc
        current > acc -> current
        true -> acc
      end
    end)
  end

  # implement leet code 658 which return a list of closest numbers
  # k elements its the list size
  # exist art state with binary search and window?
  # binary search using elixir?
end
