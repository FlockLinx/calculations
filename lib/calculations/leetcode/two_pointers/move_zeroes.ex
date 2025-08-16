defmodule Calculations.Leetcode.TwoPointers.MoveZeroes do
  def solution(nums) do
    tup = List.to_tuple(nums)
    len = tuple_size(tup) - 1

    mover(tup, len, 0, 0) |> Tuple.to_list()
  end

  def mover(tup, len, slow, _fast) when slow >= len, do: tup

  def mover(tup, len, slow, fast) when fast > len do
    mover(tup, len, slow + 1, slow + 2)
  end

  def mover(tup, len, slow, fast) do
    cond do
      elem(tup, slow) == 0 && elem(tup, fast) == 0 ->
        mover(tup, len, slow, fast + 1)

      elem(tup, slow) != 0 ->
        mover(tup, len, slow + 1, slow + 2)

      elem(tup, slow) == 0 && elem(tup, fast) != 0 ->
        val1 = elem(tup, fast)
        tupa = put_elem(tup, slow, val1)
        tupam = put_elem(tupa, fast, 0)
        mover(tupam, len, slow + 1, slow + 2)
    end
  end
end
