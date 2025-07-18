defmodule Calculations.Codewars.CatDogYears do
  def human_years_cat_years_dog_years(1), do: {1, 15, 15}
  def human_years_cat_years_dog_years(2), do: {2, 24, 24}

  def human_years_cat_years_dog_years(hy) do
    {hy, 24 + (hy - 2) * 4, 24 + (hy - 2) * 5}
  end
end
