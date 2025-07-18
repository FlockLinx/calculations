defmodule Calculations.Leetcode.Arrays.RomanToInteger do
  def rle(string) do
    ls = String.graphemes(string)

    for x <- ls, reduce: %{} do
      acc -> Map.update(acc, x, 1, &(&1 + 1))
    end
  end

  # "XV"
  def value_map() do
    %{"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
  end

  def solution(roman) do
    list = list_numbers(String.graphemes(roman))
    calculate_sum(list, 0)
  end

  def calculate_sum([], total), do: total
  def calculate_sum([x], total), do: x + total

  def calculate_sum([h, n | t], total) do
    if h < n do
      calculate_sum([n | t], total - h)
    else
      calculate_sum([n | t], total + h)
    end
  end

  def list_numbers([], acc \\ []), do: acc

  def list_numbers([h | t], acc) do
    %{^h => value} = value_map()
    list_numbers(t, acc ++ [value])
  end
end
