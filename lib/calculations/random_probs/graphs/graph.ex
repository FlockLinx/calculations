defmodule Calculations.RandomProbs.Graphs.Graph do
  # graph = %{alice: [:bob, :carol], bob: [:alice, :dave], carol: [:alice], dave: [:bob], eve: [:frank], frank: [:eve]}

  def dfs(graph, start, visited \\ MapSet.new()) do
    if MapSet.member?(visited, start) do
      visited
    else
      visited = MapSet.put(visited, start)

      Enum.reduce(graph[start] || [], visited, fn neighbor, acc ->
        dfs(graph, neighbor, acc)
      end)
    end
  end

  def dfs_v2(graph, start) do
    dfs_v2(graph, start, MapSet.new())
  end

  defp dfs_v2(graph, start, visited) do
    if MapSet.member?(visited, start) do
      visited
    else
      visited = MapSet.put(visited, start)

      for neighbor <- graph[start] || [], reduce: visited do
        acc -> dfs_v2(graph, neighbor, acc)
      end
    end
  end

  def bfs(graph, start) do
    bfs(graph, [start], MapSet.new())
  end

  defp bfs(_graph, [], visited), do: visited

  defp bfs(graph, [current | queue], visited) do
    if MapSet.member?(visited, current) do
      bfs(graph, queue, visited)
    else
      visited = MapSet.put(visited, current)
      neighbors = graph[current] || []
      bfs(graph, queue ++ neighbors, visited)
    end
  end

  def friends_list(graph, start) do
    fl = []
    [_h | t] = friends_list(graph, [start], fl)

    t
  end

  defp friends_list(_graph, [], fl), do: fl

  defp friends_list(graph, [current | queue], fl) do
    if Enum.member?(fl, current) do
      friends_list(graph, queue, fl)
    else
      neighbors = graph[current] || []
      friends_list(graph, queue ++ neighbors, fl ++ [current])
    end
  end

  # def has_cicle(graph, start) do
  # DFS with back-edge verification
  # verify parent? if already there has_cicle is true
  # maybe where the algo come from?
  # start = :alice

  # dfs_cicle(graph, start, MapSet.new(), [], false)
  # end

  #  def dfs_cicle(graph, start, visited, parents, cicle_detected) do
  # if MapSet.member?(visited, start) do
  #   {visited, parents, cicle_detected}
  # else
  #  visited = MapSet.put(visited, start)
  #   parents = [start | parents]
  #   for n <- graph[start] || [], reduce: visited do
  #     Enum.member?(parents, start) 
  #     acc -> dfs_cicle(graph, n, visited, parents, cl)
  #   end
  # end
  # end
end
