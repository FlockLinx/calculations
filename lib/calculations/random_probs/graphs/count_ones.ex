defmodule Calculations.RandomProbs.Graphs.CountOnes do
  def running_grid(grid) do
    Enum.reduce(grid, {0, 0}, fn row, {total_ones, total_zeros} ->
      {rows_ones, rows_zeros} =
        Enum.reduce(row, {0, 0}, fn
          1, {ones, zeros} -> {ones + 1, zeros}
          0, {ones, zeros} -> {ones, zeros + 1}
        end)

      {total_ones + rows_ones, total_zeros + rows_zeros}
    end)
  end

  def full_lines_and_coluns(grid) do
    rows = fully_lines(grid)
    cols = fully_lines(transpose(grid))

    {rows, cols}
  end

  def fully_lines(grid) do
    total_rows = length(grid)

    Enum.reduce(grid, 0, fn row, acc ->
      counting_rows =
        Enum.reduce(row, 0, fn
          1, acc2 -> acc2 + 1
          0, acc2 -> acc2
        end)

      if counting_rows == total_rows do
        acc + 1
      else
        acc
      end
    end)
  end

  def transpose(grid) do
    n_cols = length(hd(grid))

    # cria um grid de listas vazias
    # ele funcionara como acc
    # a cada iteracao adiciono ao acc no index
    empty_cols = for _ <- 1..n_cols, do: []

    Enum.reduce(grid, empty_cols, fn rows, acc_cols ->
      Enum.reduce(Enum.with_index(rows), acc_cols, fn {val, idx}, acc ->
        List.update_at(acc, idx, fn col -> col ++ [val] end)
      end)
    end)
  end
end
