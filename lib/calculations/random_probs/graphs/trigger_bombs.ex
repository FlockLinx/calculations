defmodule Calculations.RandomProbs.Graphs.TriggerBombs do
  def dist({x1, y1}, {x2, y2}) do
    (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
  end

  def max_detonated(bombs) do
    bombs = Enum.map(bombs, fn [x, y, r] -> {x, y, r} end)

    graph =
      for {x1, y1, r1} <- bombs,
          into: %{},
          do:
            {{x1, y1, r1},
             Enum.filter(bombs, fn {x2, y2, _} ->
               dist({x1, y1}, {x2, y2}) <= r1 * r1
             end)}

    Enum.map(graph, fn {bomb, _} ->
      count_detonated(graph, bomb)
    end)
    |> Enum.max()
  end

  defp count_detonated(graph, start) do
    dfs(graph, start, MapSet.new()) |> MapSet.size()
  end

  def dfs(graph, node, visited) do
    if MapSet.member?(visited, node) do
      visited
    else
      visited = MapSet.put(visited, node)

      Enum.reduce(graph[node] || [], visited, fn neighbor, acc ->
        require IEx
        IEx.pry()
        dfs(graph, neighbor, acc)
      end)
    end
  end
end
