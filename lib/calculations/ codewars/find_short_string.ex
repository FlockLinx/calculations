defmodule Calculations.Codewars.FindShortString do
  def solution(s) do
    string_list = String.split(s)
    list_length = length(string_list)

    recursive_sol(string_list, hd(string_list))
  end

  def recursive_sol([], acc), do: acc

  def recursive_sol([hd | tl], acc) do
    string_length = length(String.graphemes(hd))

    if string_length < acc do
      recursive_sol(tl, string_length)
    else
      recursive_sol(tl, acc)
    end
  end
end
