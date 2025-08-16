defmodule Calculations.RandomProbs.ReverseStringV2 do
  def solution(string) do
    tup = string |> String.graphemes() |> List.to_tuple()
    len = tuple_size(tup) - 1

    to_reverse(tup, 0, len) |> Tuple.to_list() |> List.to_string()
  end

  def to_reverse(tup, l, r) when l >= r, do: tup

  def to_reverse(tup, l, r) do
    s = elem(tup, l)
    t = elem(tup, r)

    tup
    |> put_elem(l, t)
    |> put_elem(r, s)
    |> to_reverse(l + 1, r - 1)
  end
end
