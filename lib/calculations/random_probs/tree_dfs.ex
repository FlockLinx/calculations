defmodule Calculations.RandomProbs.TreeDfs do
  #prob 1
  # count leaf nodes by given tree
  # leaf - nodes without children
  # tree = {5, {3, {1, nil, nil}, {4, nil, nil}}, {8, nil, {9, nil, nil}}}
  # tree2 = {5, {4, {11, {7, nil, nil}, {2, nil, nil}}, nil},{8, {13, nil, nil}, {4, nil, {1, nil, nil}}}}
  # tree3 = {1, {2, nil, nil}, {3, nil, nil}}

  def count_leaves(nil), do: 0
  def count_leaves({value, nil, nil}), do: 1
  def count_leaves({_value, left, right}) do
    count_leaves(left) + count_leaves(right)
  end

  def list_leaves_value(nil), do: []
  def list_leaves_value({value, nil, nil}), do: [value]
  def list_leaves_value({_value, left, right}) do
    list_leaves_value(left) ++ list_leaves_value(right)
  end

  def count_only_even_leaves(nil), do: 0
  def count_only_even_leaves({value, nil, nil}) when rem(value, 2) != 0, do: 1
  def count_only_even_leaves({_, nil, nil}), do: 0
  def count_only_even_leaves({_value, left, right}) do
    count_only_even_leaves(left) + count_only_even_leaves(right)
  end

  def count_only_greater_than(nil, n), do: 0
  def count_only_greater_than({value, nil, nil}, n) when value > n, do: 1
  def count_only_greater_than({_value, left, right}, n) do
    count_only_greater_than(left, n) + count_only_greater_than(right, n)
  end

  def max_depth(nil), do: 0
  def max_depth({_value, left, right}), do: 1 + max(max_depth(left), max_depth(right))

  def exists_in_tree({value, left, right}, n) when value == n, do: true
  def exists_in_tree(nil, n), do: false
  def exists_in_tree({_value, left, right}, n) do
    exists_in_tree(left, n) || exists_in_tree(right, n)
  end

  def invert_tree(nil), do: nil
  def invert_tree({value, left, right}) do
    {value, invert_tree(right), invert_tree(left)}
  end
end
