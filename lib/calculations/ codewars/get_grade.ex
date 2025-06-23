defmodule Calculations.Codewars.GetGrade do
  def get_grade(a, b, c) do
    grade(div(a + b + c, 3))
  end

  def grade(n) when n >= 90 and n <= 100, do: "A"
  def grade(n) when n >= 80 and n < 90, do: "B"
  def grade(n) when n >= 70 and n < 80, do: "C"
  def grade(n) when n >= 60 and n < 70, do: "D"
  def grade(n) when n >= 0 and n < 60, do: "F"
end
