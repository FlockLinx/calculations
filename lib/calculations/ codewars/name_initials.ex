defmodule Calculations.Codewars.NameInitials do
  def abbrev_name(name) do
    [h1 | t] = name |> String.split(" ")
    [h2 | _] = t
    "#{String.first(String.capitalize(h1))}.#{String.first(String.capitalize(h2))}"
  end
end
