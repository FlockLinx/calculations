defmodule Calculations.Codewars.ArrayDiff do
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
  #
  #

  # **** [head | array_diff(tail, b)] <- esse passo mantem o valor e chama dentro da lista ****

  #   def array_diff([], _b), do: []
  #   def array_diff(a, []), do: a
  #   def array_diff([ha | ta], [hb | tb]) when ha == hb, do: array_diff(ta, [hb | tb])
  #   def array_diff([ha | ta], b), do: [ha | array_diff(ta, b)]
  #   def array_diff([ha | ta], [hb | tb]), do: array_diff([ha | ta], tb)
  #
  def array_diff([], _b), do: []
  def array_diff(a, []), do: a

  def array_diff([head | tail], b) do
    case contains?(head, b) do
      true -> array_diff(tail, b)
      false ->  [head | array_diff(tail, b)]
    end
  end

  def contains?(_x, []), do: false
  def contains?(x, [x | _]), do: true
  def contains?(x, [_ | tail]), do: contains?(x, tail)
end
