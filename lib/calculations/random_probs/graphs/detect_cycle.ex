defmodule Calculations.RandomProbs.Graphs.DetectCycle do
  # n = number of vertex/nodes
  # n = 3
  # edges - list of list of edges
  # edges = [[0,1], [1,2], [2,0]]

  def has_cycle(n, edges) do
    graph = draw_graph(n, edges)

    iterative_dfs(graph, [hd(hd(edges))], MapSet.new())
  end

  def draw_graph(n, edges) do
    # empty graph
    step1 =
      for v <- 0..(n - 1), reduce: %{} do
        acc -> Map.put(acc, v, [])
      end

    # bi-directional needs to update for u and v
    for [u, v] <- edges, reduce: step1 do
      acc ->
        acc
        |> Map.update!(u, fn list -> [v | list] end)
        |> Map.update!(v, fn list -> [u | list] end)
    end
  end

  def iterative_dfs(graph, [], visited), do: false
  def iterative_dfs(graph, stack, true), do: true

  def iterative_dfs(graph, [source | stack], visited) do
    cond do
      MapSet.member?(visited, source) ->
        true

      true ->
        visited = MapSet.put(visited, source)
        neighbors = graph[source] || []

        Enum.reduce(graph, visited, fn neighbor, acc ->
          iterative_dfs(graph, neighbors ++ stack, acc)
        end)
    end
  end
end
