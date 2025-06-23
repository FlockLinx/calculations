defmodule Calculations.Codewars.BetweenNumbers do
  def between(a, b, list \\ []) when b >= a, do: between(a, _b = b - 1, [b | list])
  def between(a, b, list) when b < a, do: list

  # better version
  def bbetween(a, b) when a == b, do: [a]
  def bbetween(a, b), do: [a] ++ between(a + 1, b)
end
