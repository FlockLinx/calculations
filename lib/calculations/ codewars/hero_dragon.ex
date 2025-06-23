defmodule Calculations.Codewars.HeroDragon do
  def survive(bullets, dragons) when bullets >= dragons * 2, do: true
  def survive(_bullets, _dragons), do: false
end
