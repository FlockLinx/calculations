defmodule Calculations.RandomProbs.TriggerBombs2 do
  def distance({x1, y1}, {x2, y2}) do
    (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
  end

  def in_range?([x1, y1, r1], [x2, y2, _r2]) do
    distance({x1, y1}, {x2, y2}) <= r1 * r1
  end

  def max_detonated(bombs) do
    indexed_bombs = Enum.with_index(bombs)

    graph =
      for {bomb1, idx1} <- indexed_bombs,
          into: %{},
          do:
            {idx1,
             Enum.reduce(indexed_bombs, [], fn {bomb2, idx2}, acc ->
               if idx1 != idx2 && in_range?(bomb1, bomb2) do
                 [idx2 | acc]
               else
                 acc
               end
             end)}

    Enum.map(0..(length(bombs) - 1), fn idx ->
      count_detonated(graph, idx)
    end)
    |> Enum.max()
  end

  def count_detonated(graph, start) do
    dfs(graph, start, MapSet.new()) |> MapSet.size()
  end

  def dfs(graph, node, visited) do
    if MapSet.member?(visited, node) do
      visited
    else
      visited = MapSet.put(visited, node)

      Enum.reduce(graph[node] || [], visited, fn neighbor, acc ->
        dfs(graph, neighbor, acc)
      end)
    end
  end
end
