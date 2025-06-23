defmodule Calculations.Codewars.AverageCalculator do
  def get_average(marks) do
    div(list_sum(marks), list_lenght(marks))
  end

  def list_sum([], acc), do: acc
  def list_sum([h | t], acc \\ 0), do: list_sum(t, acc + h)

  def list_lenght([], acc \\ 0), do: acc
  def list_lenght([_h | t], acc), do: list_lenght(t, acc + 1)
end
