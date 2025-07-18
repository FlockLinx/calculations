defmodule Calculations.Codewars.ProductArray do
  def product_array(nums) do
    {_, result} =
      Enum.reduce(nums, {0, []}, fn _, {counter, result} ->
        {_, list} = List.pop_at(nums, counter)
        {counter + 1, [times_list_values(list) | result]}
      end)

    reverse_list(result, [])
  end

  def reverse_list([], acc), do: acc
  def reverse_list([h | t], acc), do: reverse_list(t, [h | acc])

  def times_list_values([]), do: 1
  def times_list_values([h | t]), do: h * times_list_values(t)
end
