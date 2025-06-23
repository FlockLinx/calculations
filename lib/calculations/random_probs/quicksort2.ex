defmodule Calculations.RandomProbs.Quicksort2 do
  #Given a string with only numbers, return ordened string
  # sort_string("927124") - "122479"
  
  def sort_string(s) do
    string_list = s |> String.split("", trim: true)
    qsort(string_list) |> list_to_string() 
  end

  def qsort([]), do: []
  def qsort([h|t]) do
    smaller = Enum.filter(t, fn n -> n <= h end)
    larger = Enum.filter(t, fn n -> n > h end)

    qsort(smaller) ++ [h] ++ qsort(larger)
  end

  def list_to_string([]), do: ""
  def list_to_string([h|t]), do: h <> list_to_string(t)
end
