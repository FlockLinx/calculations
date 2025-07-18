defmodule Calculations.Leetcode.Graphs.FindPath do
  # I have to draw the graph, with n and edges array
  # I can use DFS and BFS, I will try DFS but I think BFS is better because I need to check neighbors
  # and path
  # edges = [[0,1],[1,2],[2,0]] 
  # n = 3

  # for [u,v] <- edges, reduce: empty_graph do 
  #  acc -> acc |> Map.update!(u, fn list -> [v|list] end) 
  #             |> Map.update!(v, fn list -> [u | list] end) 
  # end
  # %{0 => [2, 1], 1 => [2, 0], 2 => [0, 1]}

  def dgraph(n) do
    Enum.reduce(0..(n - 1), %{}, fn v, acc ->
      Map.put(acc, v, [])
    end)
  end

  def dgraph_step2(egraph, edges) do
    Enum.reduce(edges, egraph, fn [u, v], acc ->
      acc
      |> Map.update!(u, fn list -> [v | list] end)
      |> Map.update!(v, fn list -> [u | list] end)
    end)
  end

  # %{0 => [2, 1], 1 => [2, 0], 2 => [0, 1]

  def dfs_solution(n, edges, source, destination) do
    graph = dgraph_step2(dgraph(n), edges)

    dfs(graph, source, destination, MapSet.new())
  end

  def bfs_solution(n, edges, source, destination) do
    graph = dgraph_step2(dgraph(n), edges)
    bfs(graph, [source], destination, MapSet.new())
  end

  def bfs_better_solution(n, edges, source, destination) do
    graph = dgraph_step2(dgraph(n), edges)
    queue = :queue.in(source, :queue.new())

    better_bfs(graph, queue, source, destination, MapSet.new())
  end

  def dfs(graph, source, destination, visited) do
    cond do
      source == destination ->
        true

      MapSet.member?(visited, source) ->
        false

      true ->
        visited = MapSet.put(visited, source)

        Enum.any?(graph[source] || [], fn neighbor ->
          dfs(graph, neighbor, destination, visited)
        end)
    end
  end

  def dfs_iterative_solution(n, edges, source, destination) do
    graph = dgraph_step2(dgraph(n), edges)

    iterative_dfs(graph, [source], destination, MapSet.new())
  end

  def iterative_dfs(_graph, [], _destination, _visited), do: false

  def iterative_dfs(graph, [source | stack], destination, visited) do
    cond do
      source == destination ->
        true

      MapSet.member?(visited, source) ->
        iterative_dfs(graph, stack, destination, visited)

      true ->
        visited = MapSet.put(visited, source)
        neighbor = graph[source] || []
        iterative_dfs(graph, [neighbor | stack], destination, visited)
    end
  end

  def bfs(_graph, [], _destination, _visited), do: false

  def bfs(graph, [source | queue], destination, visited) do
    cond do
      source == destination ->
        true

      MapSet.member?(visited, source) ->
        bfs(graph, queue, destination, visited)

      true ->
        visited = MapSet.put(visited, source)
        neighbor = graph[source] || []
        bfs(graph, queue ++ neighbor, destination, visited)
    end
  end

  def better_bfs(graph, queue, source, destination, visited) do
    case :queue.out(queue) do
      {:empty, _} ->
        false

      {{:value, source}, queue} ->
        cond do
          source == destination ->
            true

          MapSet.member?(visited, source) ->
            better_bfs(graph, queue, source, destination, visited)

          true ->
            visited = MapSet.put(visited, source)
            neighbors = graph[source] || []
            queue = Enum.reduce(neighbors, queue, fn n, q -> :queue.in(n, q) end)
            better_bfs(graph, queue, source, destination, visited)
        end
    end
  end
end
