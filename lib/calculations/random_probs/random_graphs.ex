defmodule Calculations.RandomProbs.RandomGraps do
  # graph = %{a: [:b, :c], b: [:a, :c] }
  # graph = %{alice: [:bob, :carol], bob: [:alice, :dave], carol: [:alice], dave: [:bob], eve: [:dave, :frank], frank: [:eve]}
  # how can I detect cicles?
  # how can I detect isolated nodes?
  # can I show the algo path?

  def bfs(graph, start) do
    bfs(graph, [start], MapSet.new(), MapSet.new())
  end

  defp bfs(_graph, [], visited, path), do: {MapSet.to_list(visited), path}

  defp bfs(graph, [current | queue], visited, path) do
    if MapSet.member?(visited, current) do
      path = MapSet.put(path, current)
      bfs(graph, queue, visited, path)
    else
      neighbors = graph[current] || []
      visited = MapSet.put(visited, current)
      path = MapSet.put(path, current)
      bfs(graph, queue ++ neighbors, visited, path)
    end
  end

  def dfs(graph, start) do
    dfs(graph, start, MapSet.new())
  end

  defp dfs(graph, start, visited) do
    # base case maybe?
    if MapSet.member?(visited, start) do
      visited
    else
      visited = MapSet.put(visited, start)

      for neighbor <- graph[start] || [], reduce: visited do
        acc -> dfs(graph, neighbor, acc)
      end
    end
  end
end
