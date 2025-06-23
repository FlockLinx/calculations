defmodule Calculations.Codewars.SentenceSmash do
  def smash([]), do: ""
  def smash([h]), do: "#{h}"
  def smash([h | t]), do: "#{h} " ++ smash(t)
end
