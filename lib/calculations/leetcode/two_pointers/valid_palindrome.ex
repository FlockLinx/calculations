defmodule Calculations.Leetcode.TwoPointers.ValidPalindrome do
  def is_palindrome(s) do
    tup = s |> parse_string() |> String.graphemes() |> List.to_tuple()
    check(tup, 0, tuple_size(tup) - 1)
  end

  def check(tup, left, right) when left >= right, do: true

  def check(tup, left, right) do
    if elem(tup, left) != elem(tup, right) do
      false
    else
      check(tup, left + 1, right - 1)
    end
  end

  def parse_string(string) do
    str = String.downcase(string)
    Regex.replace(~r/[^a-zA-Z0-9]/, str, "")
  end
end
