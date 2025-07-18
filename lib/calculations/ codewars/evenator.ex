defmodule Calculations.Codewars.Evenator do
  def even?(n) when is_float(n) do
    case trunc(n / 2) - n == 0.0 do
      true -> true
      false -> false
    end
  end

  def even?(n) when rem(n, 2) == 0, do: true
  def even?(n), do: false

  def reverse([]), do: []
  def reverse([n]), do: [n]
  def reverse([h | t]), do: reverse(t) ++ [h]
end
