defmodule Calculations.Codewars.ReversedWords do
  # take the text, transform into list
  # can solved with recursion
  # base case - []
  # recursive case -  take h and append to list [] ++ [h]

  def reverse_words(s) do
    list_to_string(reverse_list(string_to_list(s)), "")
  end

  def string_to_list(s), do: s |> String.split(" ", trim: true)

  def reverse_list([]), do: []
  def reverse_list([h | t]), do: reverse_list(t) ++ [h]

  def list_to_string([], s), do: s
  def list_to_string([n], s), do: s <> "#{n}"
  def list_to_string([h | t], s), do: list_to_string(t, s <> "#{h} ")
end
