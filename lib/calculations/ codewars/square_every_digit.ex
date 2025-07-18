defmodule Calculations.Codewars.SquareEveryDigit do
  def square_digits(0), do: 0

  def square_digits(n) do
    n
    |> integer_to_list([])
    |> square_list([])
    |> rev_list()
    |> concatenate()
    |> String.to_integer()
  end

  def rev_list([]), do: []
  def rev_list([n]), do: [n]
  def rev_list([h | t]), do: rev_list(t) ++ [h]

  def concatenate([]), do: ""
  def concatenate([h | t]), do: to_string(h) <> concatenate(t)

  def square_list([], acc), do: acc
  def square_list([hd | tl], acc), do: square_list(tl, [hd * hd | acc])

  def integer_to_list(0, list), do: list
  def integer_to_list(n, list) when n < 10, do: integer_to_list(0, [n | list])
  def integer_to_list(n, list), do: integer_to_list(div(n, 10), [rem(n, 10) | list])
end
