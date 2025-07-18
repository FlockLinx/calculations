defmodule Calculations.Codewars.FakeBinary do
  def generate(str) do
    list = str |> String.split("", trim: true)
    fake_generate(list)
  end

  def fake_generate([]), do: ""

  def fake_generate([h | t]) do
    case String.to_integer(h) >= 5 do
      true -> "1" <> fake_generate(t)
      false -> "0" <> fake_generate(t)
    end
  end
end
