defmodule Calculations.Codewars.TripleTrouble do
  def triple_trouble(one, two, three) do
    l_st = string_to_list(one)
    l_nd = string_to_list(two)
    l_rd = string_to_list(three)
    list_to_string(mix_lists(l_st, l_nd, l_rd))
  end

  def mix_lists([], [], [], list \\ []), do: list

  def mix_lists([h1 | t1], [h2 | t2], [h3 | t3], list) do
    mix_lists(t1, t2, t3, list ++ [h1] ++ [h2] ++ [h3])
  end

  def string_to_list(s), do: String.split(s, "", trim: true)
  def list_to_string([], acc \\ ""), do: acc
  def list_to_string([h | t], acc), do: list_to_string(t, acc <> "#{h}")
end
