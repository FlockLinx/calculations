defmodule Calculations.Codewars.ReverseString do
  def reverse(string) do
    to_string(reverse_list(String.split(string, "", trim: true)))
  end

  def reverse_list(list, acc \\ [])
  def reverse_list([], acc), do: acc

  def reverse_list([h|t], acc) do
    reverse_list(t, [h | acc])
  end
end
