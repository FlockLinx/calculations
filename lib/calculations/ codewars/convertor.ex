defmodule Calculations.Codewars.Convertor do
  def dna_to_rna(dna) do
    dna
    |> String.split("", trim: true)
    |> rna_maker()
  end

  def rna_maker([h | t]) when h == "T", do: "U" <> rna_maker(t)
  def rna_maker([h | t]), do: "#{h}" <> rna_maker(t)
  def rna_maker([]), do: ""
end
