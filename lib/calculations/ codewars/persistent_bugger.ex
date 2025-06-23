defmodule Calculations.Codewars.PersistentBugger do
  # can I solve this with recursion? - yes but I believe its not trivial
  # receive n - when > 10 need to split and multply each number ultil
  # number is greather than 10 (two digits)
  # so I believe that I can solve this problem with 2 steps
  # step 1 - split number
  # step 2 - multiply each number and verify if > 10 if so repeat/..
  def persistence(n) when n > 10 do
    persistence(multiplier(int_to_list(n)))
  end

  def persistence(n), do: n

  def int_to_list(n) when n > 10 do
    item = div(n, 10)
    int_to_list(item) ++ [rem(n, 10)]
  end

  def int_to_list(n), do: [n]

  def multiplier([h | t]), do: h * multiplier(t)
  def multiplier([]), do: 1
end
