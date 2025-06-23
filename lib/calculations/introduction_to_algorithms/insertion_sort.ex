defmodule Calculations.IntroductionToAlgorithms.InsertionSort do
  # sort by insertion
  # can I solve using recursion
  # # base case/stop condition
  # def sorting([]), do: []
  # def sorting([a]), do: [a]
  # How can I know if all itens are sorted?
  #
  # my failling solution
  # def sorting([]), do: []
  # def sorting([a]), do: [a]
  # def sorting([h, n | t]) when h >= n, do: [n | sorting([h | t])]
  # def sorting([h, n | t]), do: [h | sorting([n | t])]

  # final solution
  def sorting([]), do: []
  def sorting([h | t]), do: insert(h, sorting(t))

  defp insert(x, []), do: [x]
  defp insert(x, [h | t]) when x <= h, do: [x, h | t]
  defp insert(x, [h | t]), do: [h | insert(x, t)]

  # can I solve using for loop and index
  #
end
