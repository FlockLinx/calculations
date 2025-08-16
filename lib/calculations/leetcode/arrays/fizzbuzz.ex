defmodule Calculations.Leetcode.Fizzbuzz do
  def solution(n) do
    Enum.reduce(1..n, [], fn x, acc ->
      cond do
        rem(x, 3) == 0 && rem(x, 5) == 0 -> ["FizzBuxzz" | acc]
        rem(x, 3) == 0 -> ["Fizz" | acc]
        rem(x, 5) == 0 -> ["Buzz" | acc]
        true -> [x | acc]
      end
    end)
    |> Enum.reverse()
  end
end
