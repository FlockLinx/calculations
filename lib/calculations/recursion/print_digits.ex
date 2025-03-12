defmodule Calculations.Recursion.PrintDigits do
  @moduledoc """

  """
  def upto(0), do: 0

  def upto(num) do
    IO.puts(num)
    upto(num - 1)
  end

  def upt(0), do: 0

  def upt(num) do
    upt(num - 1)
    IO.puts(num)
  end

  def sum_digits(0), do: 0

  # just a recursive function
  def sum_digits(num) do
    # num + sum_digits(num - 1)
    #
    # sum digits updated with tail recursion
    upto_tail_rec(num)
  end

  # tails recursive function
  #
  # Function definition
  def upto_tail_rec(num, acc \\ 0)
  # Recursive base case
  def upto_tail_rec(0, acc), do: acc
  # Recursive case
  def upto_tail_rec(num, acc) do
    upto_tail_rec(num - 1, acc + num)
  end

  # Factorial

  # base case
  def fac_of(1), do: 1
  # base case
  def fac_of(0), do: 1
  # Simple recursion factorial function
  def fac_of(num) do
    num * fac_of(num - 1)
  end

  # with tail recursion
  def fac_of_tail(num, acc \\ 1)
  def fac_of_tail(1, acc), do: acc

  def fac_of_tail(num, acc) do
    fac_of_tail(num - 1, acc * num)
  end

  # Work from home/ homework

  # reverse number with tail recursion
  #
  # recursion --
  # function definition
  # Base case to stop the recursion
  # recursion case function that calls itself
  # Tail recursion make it cheap
  #

  # give a number: 123
  # the response muts be 321
  #
  # 123/10 = 12
  # 123%10 = 3
  # 3 * 10
  # 12%10 = 2
  # (30 + 2) * 10 = 32
  # 1%10 = 1

  #  def reverse_number(num) do
  #    rest = rem(num, 10)
  #    num = div(num, 10)
  #    rest * 10
  #  end
  #

  # 1st iteration
  # rev_number(123, 0)
  #   acc = rem(123, 10) * 10 + 0
  #   acc = 30
  #  12, 30 = rev_number(div(123,10), 30)

  # 2nd iteration
  # rev_number(12, 30)
  #   acc = rem(12, 10) * 10 + 30
  #   acc = 32
  # 1, 32 = rev_number(div(123,10), 30)

  def rev_number(num, acc \\ 0)
  def rev_number(0, acc), do: acc

  def rev_number(num, acc) do
    rev_number(div(num, 10), acc * 10 + rem(num, 10))
  end

  # Sum itens list with tail recursion
  #
  # regular sum recursive function
  # function definition
  # base case
  # recursive case
  # regular recursive case
  def regular_sum([h | t]) do
    h + sum(t)
  end

  # Tail recursion sum
  # function definition
  # base case
  # recursive case
  def sum(num, acc \\ 0)
  def sum([], acc), do: acc

  def sum([h | t], acc) do
    sum(t, acc + h)
  end

  # function definition
  # base case
  # recursive case
  @spec reverse([any()], [any()]) :: [any()]
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  # Maps
  #  anonimous(functions, pipe, reverse(build(in / custom)))
  #
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(elements, func, acc \\ [])
  def map([], _, acc), do: reverse(acc)
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  # Contact
  #
  @spec concat([any()], [any()]) :: [any()]
  def concat(src, dst), do: concat_func(src |> reverse(), dst)
  def concat_func([], dst), do: dst
  def concat_func([h | t], dst), do: concat_func(t, [h | dst])

  # FlaMap
  #
  def flat_maps(elements, func, acc \\ [])
  def flat_maps([], _, acc), do: acc
  def flat_maps([h | t], func, acc), do: flat_maps(t, func, concat(acc, func.(h)))
end
