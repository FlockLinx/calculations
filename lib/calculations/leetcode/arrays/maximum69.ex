defmodule Calculations.Leetcode.Arrays.Maximum69 do
  def solution(num) do
    num
    |> to_list([])
    |> find_great(1, [])
    |> parse("")
    |> String.to_integer()
  end


  def find_great([], _counter, acc), do: acc
  def find_great(list, 0, acc), do: acc ++ list
  def find_great([h|t], counter, acc) do
    if h == 9 do
      find_great(t, counter, [h|acc])
    else
      find_great(t, 0, [9 | acc])
    end
  end

  def to_list(0, acc), do: acc
  def to_list(num, acc) do
    res = div(num,10)
    val = rem(num,10)
    
    to_list(res, [val | acc])
  end

  def parse([], acc), do: acc
  def parse([h|t], acc), do: parse(t, acc <> Integer.to_string(h))
end
