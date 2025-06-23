defmodule Calculations.Grokking.Cap4.FindMax do
  # poorly recursive version
  def max_in_a_list([], acc \\ 0), do: acc
  def max_in_a_list([n], acc) when acc > n, do: acc
  def max_in_a_list([n], acc) when acc < n, do: n

  def max_in_a_list([h | t], acc) do
    case h > acc do
      true -> max_in_a_list(t, h)
      false -> max_in_a_list(t, acc)
    end
  end

  # better recursive version
  def mx([]), do: 0
  def mx([n]), do: n
  def mx([h, n | t]) when h > n, do: mx(t ++ [h])
  def mx([_h | t]), do: mx(t)
end
