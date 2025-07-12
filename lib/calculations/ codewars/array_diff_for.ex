defmodule Calculations.Codewars.ArrayDiff2 do
  # If a = [1, 2] and b = [1], the result should be [2].
  # If a = [1, 2, 2, 2, 3] and b = [2], the result should be [1, 3].
  # Can be solved with recursion?
  # base case is? -> both lists are empty  maybe? []
  # regular case is? -> compare a0h with b0h if equals skip to next a1h and b0h
  # and so on until both lists are empty and the return
  # similar to? -> find max in a list, iterate with a condition if check leave the
  # value if dont skip to another

  # my solution
  # def array_diff([], _b), do: []
  # def array_diff(a, []), do: a
  # def array_diff([ha | ta], b) when ha in b, do: array_diff(ta, b)
  # def array_diff([ha, na | ta], b), do: array_diff([na | ta], b)
  #

  # if cant be solved with recursion how can I solve?
  # for loop
  # compare each element between and add different itens to a new list then return

  def array_diff(a, b) do
    for x <- a, not (x in b), do: x
  end
end
