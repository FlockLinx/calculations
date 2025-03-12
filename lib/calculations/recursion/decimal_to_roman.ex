defmodule Calculations.Recursion.DecimalToRoman do
  require IEx
  # base case
  # one term case
  # recursive case
  # value map
  #
  # Given a Decimal number convert to Roman number ex.
  #
  # "1894" convert to "MDCCCXCIV"
  #  1894 convert to "MDCCCXCIV" why not?
  # ["1", "8", "9", "4"]
  # about(decimal(houses))

  # 1 - milhar
  # 8 - centenas
  # 9 - dezenas
  # 4 - unidades

  # div(head, number_of_itens_on_list / 1)
  # div(next, number_of_itens_on_list / 10)
  # div(next, number_of_itens_on_list / 100)
  #
  #
  # Usando a função
  # {position, previous_key} = find_position_and_previous_key(roman_map, 500)
  #
  # roman number map (roman library) ok
  # decimal to roman (decimal conversor) working for regular numbers WIP
  # mapper numeral to prepare a list to iterate over it (decimnal conversor) WIP
  # join string (add_roman_to_list(result, item_roman)) +/- (works in a simple way)
  # Joing all together (build_roman) +/- its not flexible and do not iterate WIP

  def roman_library() do
    %{1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M"}
  end

  def roman_position_library(item_list, item_roman) do
    index = Enum.find_index(roman_library(), fn {k, _v} -> k == item_roman end)

    if index do
      previous_key = Enum.at(roman_library(), index - 1)
      {index, previous_key}
    else
      {:error, "Key not found"}
    end
  end

  def add_equivalent(numeral) when is_integer(numeral) do
    houses = Enum.count(Integer.digits(numeral))
    {raw_list(Integer.digits(numeral), houses), houses}
  end

  def build_roman(decimal) do
    # Missing iteration over list_number, case all itens on list number
    # are present on roman map must be returned all equivalents
    # if not must deal with exactly number and then continue
    # ex. 1700
    # [1000, 700] -> item list
    # ["M", 700] -> must deal with 700
    # ["M", "LCC"] -> join all together
    # "MLCC"
    {list_number, houses} = add_equivalent(decimal)

    # test =
    #   Enum.map(list_number, fn item ->
    #     case roman_library()[item] do
    #     end
    #   end)

    houses = houses - 1

    # position and raw list and trouble numbers
    # all functions must ended here
    #
    # item roman its not good missing 500 <> 100  and 10 <> 50 cases
    item_roman = Integer.pow(10, houses)

    value = div(decimal, item_roman)
    IEx.pry()
  end

  def trouble_numbers(decimal, item_roman, _houses) do
    quo = div(decimal, item_roman)
    # rest = rem(decimal, item_roman)

    case quo <= 3 do
      true ->
        add_roman_to_list(quo, item_roman)

      false ->
        add_roman_to_list(quo, item_roman)
        nil
    end
  end

  def add_roman_to_list(result, item_roman) do
    resp = Enum.map(1..result, fn _ -> roman_library()[item_roman] end) |> Enum.join()

    resp
  end

  # def sub_roman_to_list(result, item_roman) do
  #   roman_library(item_roman)
  # end

  def raw_list([head], 0), do: head
  def raw_list([], 0), do: []

  def raw_list([head | tail], houses) do
    raw_number = head * 10 ** (houses - 1)
    [raw_number | raw_list(tail, houses - 1)]
  end
end
