defmodule Calculations.Codewars.GrowOfPopulation do
  # def nb_year(p0, percent, aug, p) do
  #   case p0 + percent + aug >= p do
  #     true -> number(of(iterations))
  #     false -> old result + iterate_again
  #   end
  # end
  #

  def nb_year(p0, percent, aug, p) do
    recursive_growth(%{population: p0, percent: percent_transform(percent), aug: aug}, p, 1)
  end

  def recursive_growth(%{population: p, percent: _per, aug: _aug}, p, acc),
    do: acc

  def recursive_growth(%{population: p0, percent: per, aug: aug}, p, acc) do
    gr = p0 * per
    new_p0 = (p0 + (gr + aug)) |> floor()

    case new_p0 >= p do
      true ->
        acc

      false ->
        recursive_growth(%{population: new_p0, percent: per, aug: aug}, p, acc + 1)
    end
  end

  def percent_transform(percent) do
    percent / 100
  end
end
