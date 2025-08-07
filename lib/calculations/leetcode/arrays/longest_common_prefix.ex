defmodule Calculations.Leetcode.Arrays.LongestCommonPrefix do
  # calculate throught iteration of list itens
  # and Return the longest prefix.
  # Can solve with recursion? maybe.
  # stop recursion when find different letter
  # List? must eterate over each item?

  # ["flower", "flight", "flow"]
  # take h and 'save' the first letter and then compare with new h first letter
  def fd_prefix(list) do
    for n <- list do
      pref_list = find_prefix(list, [])
      [h | t] = pref_list
      compare_pref(pref_list, h)
    end
  end

  def find_prefix([], acc), do: acc

  def find_prefix([h | t], acc) do
    fst = String.first(h)
    acc = [fst | acc]

    find_prefix(t, acc)
  end

  def compare_pref([], acc), do: acc
  def compare_pref([h | t], acc) when h == acc, do: compare_pref(t, acc)

  def compare_pref([h | t], acc) when h != acc do
    {acc, false}
  end
end
