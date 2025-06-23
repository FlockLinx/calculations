defmodule Calculations.Codewars.RemoveChars do
  def remove_chars(s) do
    string_to_list(s)
    |> pop_first()
    |> invert_list()
    |> pop_first()
    |> invert_list()
    |> list_to_string
  end

  def string_to_list(s), do: s |> String.split("", trim: true)
  def list_to_string([]), do: ""
  def list_to_string([h | t]), do: "#{h}" <> list_to_string(t)
  def invert_list([]), do: []
  def invert_list([h | t]), do: invert_list(t) ++ [h]

  def pop_first([h | t]), do: t
end
