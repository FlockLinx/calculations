defmodule Calculations.Codewars.HumanDurationFormat do
  @year 31_556_926
  @day 86400
  @hour 3600
  @minute 60

  @time_list [
    {@year, "year", "years"},
    {@day, "day", "days"},
    {@hour, "hour", "hours"},
    {@minute, "minute", "minutes"}
  ]
  def format_durations(0, _), do: "now"
  def format_durations(1, []), do: "1 second"
  def format_durations(seconds, []) when seconds < 59 and seconds > 1, do: "#{seconds} seconds"

  def format_durations(seconds, acc \\ @time_list) do
    [{h, s, p} | t] = acc
    res = rem(seconds, h)
    divs = div(seconds, h)

    if seconds >= h do
      if res == 0 do
        "#{divs} #{s}"
      else
        if divs > 1 do
          "#{divs} #{p} and " <> format_durations(res, t)
        else
          "#{divs} #{s} and " <> format_durations(res, t)
        end
      end
    else
      format_durations(res, t)
    end
  end
end
