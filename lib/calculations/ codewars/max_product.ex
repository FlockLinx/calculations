defmodule Calculations.Codewars.MaxProduct do
  def max_product_v1(arr, size) do
    rev_arr = reverse(quick_sort(arr), [])

    {max_arr, _acc} =
      Enum.reduce(rev_arr, {[], 0}, fn x, {max_arr, acc} ->
        if acc < size do
          {[x | max_arr], acc + 1}
        else
          {max_arr, acc}
        end
      end)

    product_list(max_arr, 1)
  end

  def max_product_v2(arr, size) do
    rev_arr = reverse(quick_sort(arr), [])

    {max_arr, _acc} =
      for x <- rev_arr, reduce: {[], 0} do
        {current_arr, acc} ->
          if x < size do
            {[x | current_arr], acc + 1}
          else
            {current_arr, acc}
          end
      end

    product_list(max_arr, 1)
  end

  def product_list([], acc), do: acc
  def product_list([h | t], acc), do: product_list(t, acc * h)

  def reverse([], result), do: result
  def reverse([h | t], result), do: reverse(t, [h | result])

  def quick_sort([]), do: []

  def quick_sort([h | t]) do
    left = Enum.filter(t, fn x -> x <= h end)
    right = Enum.filter(t, fn x -> x > h end)

    quick_sort(left) ++ [h] ++ quick_sort(right)
  end
end
