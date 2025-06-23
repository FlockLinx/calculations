defmodule Calculations.Codewars.ClockMiliseconds do
  def past(h, m, s) do
    hour_to_mili(h) + minute_to_mili(m) + seconds_to_mili(s)
  end

  def hour_to_mili(h), do: 60 * minute_to_mili(h)
  def minute_to_mili(m), do: 60 * seconds_to_mili(m)
  def seconds_to_mili(s), do: s * 1000

  # hour == 360,000 miliseconds
  # minute == 60,000 miliseconds
  # seconds == 1,000 miliseconds
end
