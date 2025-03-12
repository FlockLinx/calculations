defmodule Calculations.Recursion.RomanConverter do
  require IEx
  # solve this problem with tail recursion
  # must do
  # base case
  # recursion case
  # need one func to receive roman number
  # need transform string to list of roman simbols
  # need to have a translate function
  # need acc to receive updated decimal value

  # value map
  # def translate(roman_simbol) do
  #   %{
  #     "I" => 1,
  #     "V" => 5,
  #     "X" => 10,
  #     "L" => 50,
  #     "C" => 100,
  #     "D" => 500,
  #     "M" => 1000
  #   }
  # end

  def library(test) do
    %{"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}[test]
  end

  def roman_conversor(roman_number) do
    roman_number
    |> String.split(~r/.{1}/, include_captures: true, trim: true)
    |> convert(0)
  end

  # base case
  def convert([], acc), do: acc

  # only 1 element inside the list
  def convert([current], acc) do
    acc + library(current)
  end

  # recursion case with h and t
  def convert([current, next | rest], acc) do
    current_value = library(current)
    next_value = library(next)

    case current_value < next_value do
      true -> convert([next | rest], acc - current_value)
      false -> convert([next | rest], acc + current_value)
    end
  end
end
