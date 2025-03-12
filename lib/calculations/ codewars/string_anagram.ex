defmodule Calculations.Codewars.StringAnagram do
  # Can be solved with recursion
  # transform both strings in lists
  # check if item a contains item b if all checks return true
  # if not returns false
  # base case? a or b is empty? A and B is empty?
  # recursive case compare a head with all b items then remove item from b
  #
  def anagram?(a, b) do
    a_list = a |> String.downcase() |> String.split("", trim: true)
    b_list = b |> String.downcase() |> String.split("", trim: true)

    case length(a_list) == length(b_list) do
      true -> recursive_compare(a_list, b_list)
      false -> false
    end
  end

  def recursive_compare([], []), do: true
  def recursive_compare(nil, nil), do: true

  def recursive_compare([ahead | atail], b) do
    case Enum.member?(b, ahead) do
      true -> recursive_compare(atail, List.delete(b, ahead))
      false -> false
    end
  end
end
