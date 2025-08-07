defmodule Calculations.RandomProbs.RomanToInt do
  # given valid roman number string return related int value

  def roman_num(str) do
    r_map = %{"I" => 1, "V" => 5, "X" => 10}
    r_map[str]
  end

  def list_integer(roman_list) do
    Enum.reduce(roman_list, [], fn r, acc ->
      [roman_num(r) | acc]
    end)
    |> rev_list([])
  end

  def rev_list([], acc), do: acc
  def rev_list([h | t], acc), do: rev_list(t, [h | acc])

  def solution(roman_str) do
    String.graphemes(roman_str)
    |> list_integer()
    |> counter_v2(0)
  end

  def counter_v2([], acc), do: acc
  def counter_v2([b], acc), do: acc + b

  def counter_v2([h, n | t], acc) do
    if h < n do
      acc = acc - h
      counter_v2([n | t], acc)
    else
      acc = acc + h
      counter_v2([n | t], acc)
    end
  end
end
