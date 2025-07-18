defmodule Calculation.Codewars.PlayBanjo do
  def are_you_playing_banjo?(name) do
    string_list = String.split(name, "", trim: true)
    [h | t] = string_list

    case h == "R" || h == "r" do
      true -> name <> " plays banjo"
      false -> name <> " does not play banjo"
    end
  end
end
