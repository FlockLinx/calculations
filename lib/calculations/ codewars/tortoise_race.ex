defmodule Calculations.Codewars.TortoiseRace do
  # can be solved with mathematical formula
  # transform velocities in m/s
  # calculate relative velocity between v1,v2
  # calculate d initial/relative velocity and then transform the result
  # transform t into list with [hour, min, sec]
  #
  # base case
  def race(v1, v2, _g) when v1 >= v2, do: [-1, -1, -1]
  def race(v1, v2, g) when v1 >= v2, do: nil

  # do not need to transform vars
  # relative velocity is v2 - v1
  # t = g / (v2 - v1) -> formula
  def race(v1, v2, g) do
    vr = v2 - v1
    t = g / vr
    hours = trunc(t)
    minutes = trunc((t - hours) * 60)
    seconds = trunc(((t - hours) * 60 - (t - hours) * 60) * 60)
    [hours, minutes, seconds]
  end
end
