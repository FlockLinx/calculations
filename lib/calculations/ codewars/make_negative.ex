defmodule Calculations.Codewars.MakeNegative do
  def make_negative(0), do: 0
  def make_negative(num) when num < 0, do: num
  def make_negative(num) when num > 0, do: num - (num * 2)
end
