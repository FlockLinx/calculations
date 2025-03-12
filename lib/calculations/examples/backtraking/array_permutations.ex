defmodule CalculationsExamplesBacktracking do
  def permutations([]), do: [[]]

  def permutations(list) do
    [
      []
      | for elem <- list, rest <- permutations(list -- [elem]) do
          [elem | rest]
        end
    ]
  end
end

# list = [1,2,3,4]
# elem = item 1 or 2 or 3
# rest = permutations([1,2,3,4] -- [elem])
