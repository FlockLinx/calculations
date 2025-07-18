defmodule Calculations.RandomProbs.TreeChallenge do
  # given a tuple base tree, sum all nodes greater than n
  # tuple based tree example:
  # tree = {5, 
  #   {3, {1, nil, nil}, {4, nil, nil}}, 
  #   {8, {7, nil, nil}, {9, nil, nil}}
  # }
  #
  # tree = {5, {3, {1, nil, nil}, {4, nil, nil}}, {8, {7, nil, nil}, {9, nil, nil}}}

  # DFS - depth first search
  # -> go as deep as possible and then turn back sum values (I think)

  # TreeChallenge.sum_greater_than(tree, 4)
  # Expected: 5 + 8 + 7 + 9 = 29

  # given skeleton
  def sum_greater_then(tree, n), do: sum(tree, n)
  def sum(nil, n), do: 0

  def sum({value, left, right}, n) when value > n do
    sum(left, n) + value + sum(right, n)
  end

  def sum({_value, left, right}, n) do
    sum(left, n) + sum(right, n)
  end
end
