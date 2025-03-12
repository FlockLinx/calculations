defmodule Calculations.Codewars.EnsureQuestion do
  def ensure_question(""), do: "?"

  def ensure_question(s) do
    case has_question(s) do
      true -> s
      false -> s <> "?"
    end
  end

  defp has_question(s) do
    len = String.length(s)
    "?" == String.split(s, "", trim: true) |> Enum.at(len - 1)
  end
end
