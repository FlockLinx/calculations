defmodule Calculations.Leetcode.Recurstion.PowerOfTwo do
  def is_power_of_two(0), do: true
  def is_power_of_two(1), do: true
  def is_power_of_two(2), do: true

  def is_power_of_two(n) do
    if rem(n, 2) == 0 do
      m = div(n, 2)
      is_power_of_two(m)
    else
      false
    end
  end
end
