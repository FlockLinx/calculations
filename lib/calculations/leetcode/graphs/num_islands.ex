defmodule Calculations.Leetcode.Graphs.NumIslands do
  def num_islands(grid) do
    m = length(grid)
    n = length(hd(grid))
    num_islands = 0

    for i <- 0..(m - 1) do
      for j <- 0..(n - 1) do
        if position(grid, i, j) == "1" do
          num_islands = num_islands + 1
          dfs(grid, i, j, m - 1, n - 1)
        end
      end
    end
  end

  def position(grid, i, j) do
    im = Enum.at(grid, i)
    Enum.at(im, j)
  end

  def dfs(grid, i, j, m, n) do
    if i < 0 or i >= m or j < 0 or j >= n or position(grid, i, j) == "0" do
      0
    else
      grid = List.update_at(grid, i, fn list -> List.update_at(list, j, fn item -> "0" end) end)
      dfs(grid, i, j + 1, m, n)
      dfs(grid, i + 1, j, m, n)
      dfs(grid, i, j - 1, m, n)
      dfs(grid, i - 1, j, m, n)
    end
  end

  def running_on_grid(grid) do
    lrow = length(grid)
    lcow = length(hd(grid))
    # this approach its good when we dont need to update nothing o board/grid
    Enum.with_index(grid)
    |> Enum.each(fn {row, r} ->
      Enum.with_index(row)
      |> Enum.each(fn {value, c} ->
        nil
      end)
    end)
  end
end
