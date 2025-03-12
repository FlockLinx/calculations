defmodule Calculations.Codewars.Outlier do
  # Can be solved with recursion
  # must return the outlier number
  # only integers
  # recieve a list as a parameter and return integer
  # base case list with 1 element
  # recursive case remove itens from list until keep te outlier
  # check if even or odd
  def find_outlier(integers) do
    [odd_list, even_list] = recursive_call(integers, [], [])

    case length(odd_list) == 1 do
      true -> List.first(odd_list)
      false -> List.first(even_list)
    end
  end

  def recursive_call([], odd_list, even_list), do: [odd_list, even_list]

  def recursive_call([h | t], odd_list, even_list) do
    if is_odd(h) do
      recursive_call(t, [h | odd_list], even_list)
    else
      recursive_call(t, odd_list, [h | even_list])
    end
  end

  def is_odd(x) do
    rem(x, 2) != 0
  end
end
