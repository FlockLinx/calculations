defmodule Calculations.Structs.SevenWonders do
  defstruct name: "", country: ""
  alias Calculations.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"}
    ]
  end

  def print_names(wonders) do
    Enum.each(wonders, fn %{name: name} -> IO.puts(name) end)
  end

  def filter_by_country(wonders, country) do
    Enum.filter(wonders, fn wonder -> wonder.country == country end)
  end

  def better_filter_by_country(wonders, country) do
    Enum.filter(wonders, fn %{country: country_name} -> country_name == country end)
  end

  def in_countries_starting_with_i(wonders) do
    Enum.filter(wonders, fn %{country: country_name} -> "I" == String.first(country_name) end)
  end

  def better_in_countries_starting_with_i(wonders) do
    Enum.filter(wonders, fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  def sort_by_country_lenght(wonders) do
    Enum.sort(wonders, fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc -> [[wonder.name, wonder.coutnry] | acc] end)
  end

  def contry_name_keyword_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc ->
      [{String.to_atom(wonder.name), wonder.country} | acc]
    end)
  end

  def all_names(wonders) do
    for %{name: name} <- wonders, do: name
  end
end
