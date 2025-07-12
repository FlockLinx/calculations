defmodule Calculations.Codewars.Race do
  def race(v1, v2, _g) when v1 >= v2, do: [-1, -1, -1]

  def race(v1, v2, g) do
    t = div(g,(v2 - v1))
    hours = floor(t)
    minutes = floor((t - hours) * 60)
    seconds = floor(((t - hours) * 60 - minutes) * 60)
    [hours, minutes, seconds]
  end
end
