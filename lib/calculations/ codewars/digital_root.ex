defmodule Calculations.Codewars.DigitalRoot do
  # can easily solved using recursion
  # its the same as sum and find max
  # I need to use rem and div to take all other values
  #

  def digital_root(n) do
    sum(n)
  end

  def sum(n, m \\ 0)

  def sum(n, m) when n > 0 do
    m = m + rem(n, 10)
    n = div(n, 10)

    sum(n, m)
  end

  def sum(0, m) when m >= 10, do: sum(m, 0)

  def sum(0, m), do: m
end
