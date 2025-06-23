defmodule Calculations.CodeWars.OppositesAttract do
  # If one is odd and other is even return true if not return false
  # can I solve with recurstion? I dont think so
  def inlove?(flower1, flower2) when rem(flower1, 2) == 0 and rem(flower2, 2) > 0, do: true
  def inlove?(flower1, flower2) when rem(flower1, 2) > 0 and rem(flower2, 2) == 0, do: true
  def inlove?(_flower1, _flower2), do: false
end
