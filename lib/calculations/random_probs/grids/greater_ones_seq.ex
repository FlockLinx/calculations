defmodule Calculations.RandomProbs.Grids.GreaterOnesSeq do
  def solution(grid) do
    seq_list = grid_count_seq(grid)
    max_seq(seq_list, 0)
  end

  def grid_count_seq(grid) do
    Enum.reduce(grid, [], fn rows, acc ->
      {_, _, counter} =
        Enum.reduce(rows, {0, 0, 0}, fn x, {idx, previous, counter} ->
          cond do
            x == 1 and idx == 0 -> {idx + 1, 1, counter + 1}
            x == 1 and previous == 0 -> {idx, 1, counter}
            x == 0 and previous == 1 -> {idx, 0, counter}
            x == 0 and previous == 0 -> {idx, 0, counter}
            x == 1 and previous == 1 -> {idx, 1, counter + 1}
          end
        end)

      acc ++ [counter]
    end)
  end

  def max_seq([], acc), do: acc
  def max_seq([h | t], acc) when h > acc, do: max_seq(t, h)
  def max_seq([h | t], acc), do: max_seq(t, acc)

  # T: O(nˆ2) S: O(nˆ2)

  # better solution with 'reset'

  def btt_solution(grid) do
    grid
    |> Enum.map(&max_seq_in_row(&1))
    |> Enum.max()
  end

  def max_seq_in_row(row) do
    {max_so_far, current} =
      Enum.reduce(row, {0, 0}, fn
        1, {max_so_far, current} ->
          current = current + 1
          {max(max_so_far, current), current}

        0, {max_so_far, _current} ->
          {max_so_far, 0}
      end)

    max_so_far
  end
end
