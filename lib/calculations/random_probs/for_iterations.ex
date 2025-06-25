defmodule Calculations.RandomProbs.ForIterations do
  #sum string digits
  # If I have reduce I have acc =D
  def sum_digits(str_dig) do
    for << c <- str_dig >>, reduce: 0 do 
      acc -> acc + (c - ?0)
    end
  end
  
  #count vowels with member
  def count_vowels(string) do
    for <<c <- string>>, reduce: 0 do
    acc -> case Enum.member?(~c"aeiou", c) do
        true -> acc + 1
        false -> acc
      end
    end
  end

  #count chars with updade map and reduce
  def count_chars(string) do
    for x <- String.graphemes(string), reduce: %{} do
      acc -> Map.update(acc, x, 1, fn x -> x + 1 end)
    end
  end

  #count chars with syntax sugar
  def count_chars_btt(string) do
    for x <- String.graphemes(string), reduce: %{} do
      acc -> Map.update(acc, x, 1, &(&1+1))
    end
  end

  def double_itens(list), do: for x <- list, do: x*2
  def pow_itens(list), do: for x <- list, do: x*x
  def double_with_original(list), do: for x <- list, into: %{}, do: {x, x*2}
  def convert_string_list_to_list_int(string_list), do: for x <- list, do: String.to_integer(x)

  def count_words(phrase) do
    s = phrase |> String.split(" ", trim: true)

    for c <- s, reduce: %{} do
      acc -> Map.update(acc, c, 1, &(&1+1))
    end
  end
end
