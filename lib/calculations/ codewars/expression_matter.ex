defmodule Calculations.Codewars.ExpressionMatter do
  # Given 3 integers get te largest number using +, * and () without rearrange the numbers
  # its possible to repeat operations
  # the idea it's  find the largest item in a list
  # below this operations cover all possibilities

  def expression_matter(a, b, c) do
    first = a * (b + c)
    second = a * b * c
    third = a + b * c
    fourth = (a + b) * c
    fifth = a + b + c

    max([first, second, third, fourth, fifth])
  end

  # this define the max item in na list
  def max([head]), do: head
  def max([head | [next | tail]]) when head > next, do: max([head | tail])
  def max([_head | tail]), do: max(tail)
end
