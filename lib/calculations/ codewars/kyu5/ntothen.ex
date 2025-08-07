defmodule Calculations.Codewars.Kyu5.Ntothen do
  def n2n(n, k) do
    rem(n ** n, 10 ** k)
    |> to_string()
    |> String.graphemes()
    |> reverse([])
    |> last_k(k, [])
    |> list_to_string("")
  end

  def list_to_string([], acc), do: acc
  def list_to_string([h | t], acc), do: list_to_string(t, acc <> h)

  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  def last_k([h | t], k, acc) when k >= 0, do: last_k(t, k - 1, [h | acc])
  def last_k(_list, _k, acc), do: acc
end
