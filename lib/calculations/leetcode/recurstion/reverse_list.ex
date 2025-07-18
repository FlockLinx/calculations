defmodule Calculations.Leetcode.Recurstion.ReverseList do
  def reverse_list(list) do
    rv_list(list)
  end

  def rv_list([]), do: []
  def rv_list([n]), do: [n]
  def rv_list([h | t]), do: rv_list(t) ++ [h]

  def rv_list_wacc([], acc), do: acc
  def rv_list_wacc([n], acc), do: [n | acc]
  def rv_list_wacc([h | t], acc), do: rv_list_wacc(t, [h | acc])
end
