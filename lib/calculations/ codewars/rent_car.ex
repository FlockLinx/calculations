defmodule Calculations.Codewars.RentCar do
  # rent car cost 40
  # 3+ days discount 20 off total
  # 7+ days discount 50 off total

  def rental_car_cost(d) when d >= 7, do: (d*40) - 50
  def rental_car_cost(d) when d >= 3, do: (d*40) - 20
  def rental_car_cost(d), do: d * 40
end
