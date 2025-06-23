defmodule Calculations.RandomProbs.BinaryTree do
  alias  Calculations.RandomProbs.TreeNode
  
  def insert(nil, value), do: %TreeNode{value: value}

  def insert(%TreeNode{value: val, left: l, right: r} = node, value) when value <= val do
    %TreeNode{node | left: insert(l, value)}
  end

  def insert(%TreeNode{value: val, left: l, right: r} = node, value) when value > val do
    %TreeNode{node | right: insert(r, value)}
  end
  
  def contains?(nil, _value), do: false
  def contains?(%TreeNode{value: val}, value) when value == val, do: true
  def contains?(%TreeNode{value: val, left: l}, value) when value < val, do: contains?(l, value)
  def contains?(%TreeNode{value: val, right: r}, value) when value > val, do: contains?(r, value)
  
  # inorder left -> root -> right
  def inorder(nil), do: []
  def inorder(%TreeNode{value: val, left: l, right: r}) do
    inorder(l) ++ [val] ++ inorder(r)
  end

  # postorder left -> right -> root
  def postorder(nil), do: []
  def postorder(%TreeNode{value: val, left: l, right: r}), do: postorder(l) ++ postorder(r) ++ [val]

  # preorder root -> left -> right
  def preorder(nil), do: []
  def preorder(%TreeNode{value: val, left: l, right: r}), do: [val | preorder(l) ++ preorder(r)]

  def print_tree(nil, _prefix), do: :ok
  def print_tree(%TreeNode{value: value, left: l, right: r}, prefix \\ "") do
    IO.puts("#{prefix}- #{value}")
    print_tree(l, prefix <> "  ")
    print_tree(r, prefix <> "  ")
  end
end
