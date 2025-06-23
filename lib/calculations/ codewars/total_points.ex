defmodule Calculations.Codewars.TotalPoints do
  def points(games, total \\ 0)
  def points([], total), do: total

  def points([h | t], total) do
    [a, b] = String.split(h, ":")
    points(t, total + judge(a, b))
  end

  def judge(a, b) when a > b, do: 3
  def judge(a, b) when a == b, do: 1
  def judge(a, b) when a < b, do: 0
end
