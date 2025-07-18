defmodule Calculations.Leetcode.Recurstion.RemoveElementFromList do
  def remove_elements(head, val) do
    rm_elem(head, val, [])
  end

  def rm_elem([], _val, acc), do: acc
  def rm_elem([h | t], val, acc) when h == val, do: rm_elem(t, val, acc)
  def rm_elem([h | t], val, acc) when h != val, do: rm_elem(t, val, acc ++ [h])
end
