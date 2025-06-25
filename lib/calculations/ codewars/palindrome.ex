defmodule Calculations.Codewars.Palindrome do
  # Is Palindrome Again
  # recursion can be handy here
  # string must be odd
  # iterate upto middle
  # iterate downto middle
  # compare each iteration

  # def is_palindrome(s) do
  #   s == String.reverse(s)
  # end

  def is_palindrome(s) do
    list =
      s |> String.downcase() |> String.split("", trim: true)

    list == reverse_list(list)
  end

  defp reverse_list(list, acc \\ [])
  defp reverse_list([], acc), do: acc

  defp reverse_list([h | t], acc) do
    reverse_list(t, [h | acc])
  end
  
  def is_palindrome_rev(s) do
    list_string = for <<c <- s>>, into: [], do: <<c>>
    list_string == reverse(list_string)
  end

  def reverse([]), do: []
  def reverse([n]), do: [n]
  def reverse([h|t]), do: reverse(t) ++ [h]
end
