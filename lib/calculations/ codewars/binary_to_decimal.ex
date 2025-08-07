defmodule Calculations.Codewars.BinaryToDecimal do
  # [1,0,1,1,0]
  # can I solve using recursion > yes
  # base case []
  # recursive case, list still have itens
  # how the binary formula works? 
  # for each position item I must pow by 2 to and multply
  # position 0 - 2^0 * 0 == 0
  # position 1 - 2^1 * 1 == 2
  # position 2 - 2^2 * 1 == 4
  # position 3 - 2^3 * 0 == 0
  # position 4 - 2^4 * 1 == 16
  # when [] sum all results 16+4+2 == 22

  def bin_to_dec(string) do
    list = String.graphemes(string)
    len = length(list)
    find_dec(list, len - 1)
  end

  def find_dec([], _len), do: 0

  def find_dec([h | t], len) do
    2 ** len * String.to_integer(h) + find_dec(t, len - 1)
  end
end
