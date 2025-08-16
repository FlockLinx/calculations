defmodule Calculations.RandomProbs.RobotMoves do
  # Input: "UUDDLRLR"
  # output: (0, 0)
  # output must be only two coordenates

  def solution(instructions) do
    instructions
    |> String.graphemes()
    |> map_list()
    |> verify_position()
  end

  def verify_position(pos_map) do
    x = max(pos_map["L"], pos_map["R"]) - min(pos_map["L"], pos_map["R"])
    y = max(pos_map["U"], pos_map["D"]) - min(pos_map["U"], pos_map["D"])

    {y, x}
  end

  def map_list(list) do
    Enum.reduce(list, %{"U" => 0, "D" => 0, "L" => 0, "R" => 0}, fn x, acc ->
      Map.put(acc, x, acc[x] + 1)
    end)
  end
end
