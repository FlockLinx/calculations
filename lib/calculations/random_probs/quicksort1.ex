defmodule Calculations.RandomProbs.Quicksort1 do
  def qsort([]), do: []
  def qsort([h | t]) do
    smaller = Enum.filter(t, fn n -> n <= h end)
    larger = Enum.filter(t, fn n -> n > h end)

    qsort(smaller) ++ [h] ++ qsort(larger)
  end


  #recursive filter
  #given n filter all smaller values
  def lg_list_filter([], _n, list \\ []), do: list
  def lg_list_filter([h|t], n, list) when h > n do
    lg_list_filter(t, n, list ++ [h])
  end
  def lg_list_filter([_h | t], n, list), do: lg_list_filter(t, n, list) 

  #recursive filter
  #given n filter all larger values
  def sm_list_filter([], _n, list \\ []), do: list
  def sm_list_filter([h|t], n, list) when h <= n do
    sm_list_filter(t, n, list ++ [h])
  end
  def sm_list_filter([_h | t], n, list), do: sm_list_filter(t, n, list) 


end


