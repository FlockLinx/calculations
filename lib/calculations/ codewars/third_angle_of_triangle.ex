defmodule Calculations.Codewars.ThirdAngleOfTriangle do
  @internal_sum 180

  def other_angle(a, b) do
    @internal_sum - (a + b)
  end
end
