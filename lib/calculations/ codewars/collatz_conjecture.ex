defmodule Calculations.Codewars.CollatzConjecture do
  # easily solved with recursion
  # base case given value reach -> 1
  # recursive case apply formula
  # check if is odd or even

  def hotpo(1), do: 0
  def hotpo(n), do: 1 + hotpo(collatz_formula(n, rem(n, 2) > 0))

  def collatz_formula(num, true), do: 3 * num + 1
  def collatz_formula(num, false), do: div(num, 2)
end

defmodule Calculations.Codewars.CollatzConjecture do
  # easily solved with recursion
  # base case given value reach -> 1
  # recursive case apply formula
  # check if is odd or even

  def hotpo(n) do
    recursive_collatz_call(n, 0)
  end

  def recursive_collatz_call(1, acc), do: acc

  def recursive_collatz_call(n, acc) do
    case rem(n, 2) == 0 do
      true -> recursive_collatz_call(collatz_formula(n, true), acc + 1)
      false -> recursive_collatz_call(collatz_formula(n, false), acc + 1)
    end
  end

  def collatz_formula(num, false) do
    3 * num + 1
  end

  def collatz_formula(num, true) do
    div(num, 2)
  end
end

# defmodule Calculations.Codewars.CollatzConjecture do
#   # easily solved with recursion
#   # base case given value reach -> 1
#   # recursive case apply formula
#   # check if is odd or even

#   def hotpo(1), do: 1

#   def hotpo(n), do: recursive_call(n)

#   def recursive_call(1), do: 0

#   def recursive_call(n) do
#     1 + recursive_call(collatz_formula(n, rem(n, 2) > 0))
#   end

#   def collatz_formula(num, true) do
#     3 * num + 1
#   end

#   def collatz_formula(num, false) do
#     div(num, 2)
#   end
# end
