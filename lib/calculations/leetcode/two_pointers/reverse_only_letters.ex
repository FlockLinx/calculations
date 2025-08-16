defmodule Calculations.Leetcode.TwoPointers.ReverseOnlyLetters do
  def solution(string) do
    tup = string |> String.graphemes() |> List.to_tuple()
    len = tuple_size(tup) - 1

    to_reverse(tup, 0, len)
  end

  def to_reverse(tup, l, r) when l >= r, do: tup

  def to_reverse(tup, l, r) do
    # only valid chars
    # skip and go to next sum/sub l or r
    require IEx
    s = check_until_valid_tops(tup, l, r, "")
    t = check_until_valid_down(tup, r, l, "")
    IEx.pry()

    tup
    |> put_elem(l, t)
    |> put_elem(r, s)
    |> to_reverse(l + 1, r - 1)
  end

  def check_valid_char(char) do
    Regex.match?(~r/[a-zA-Z]/, char)
  end

  def check_until_valid_tops(tup, init, limit, acc) when init == limit, do: acc

  def check_until_valid_tops(tup, init, limit, _acc) do
    char = elem(tup, init)

    if check_valid_char(char) do
      check_until_valid_tops(tup, init, init, char)
    else
      check_until_valid_tops(tup, init + 1, limit, char)
    end
  end

  def check_until_valid_down(tup, init, limit, acc) when init == limit, do: acc

  def check_until_valid_down(tup, init, limit, acc) do
    char = elem(tup, init)

    if check_valid_char(char) do
      check_until_valid_down(tup, init, init, char)
    else
      check_until_valid_down(tup, init - 1, limit, char)
    end
  end
end
