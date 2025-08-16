defmodule Calculations.RandomProbs.MergeSorta do
  def sort([]), do: []
  def sort([a]), do: [a]

  def sort(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    merge(sort(left), sort(right))
  end

  def merge(left, []), do: left
  def merge([], right), do: right

  def merge([l | left], [r | right]) when l <= r do
    [l | merge(left, [r | right])]
  end

  def merge([l | left], [r | right]) do
    [r | merge([l | left], right)]
  end
end
