defmodule Calculations.Codewars.GeometricProgretion do
  # start with first element a
  # multiply by constant r
  # to this for n times
  # must return string numbers separated by comma

  def geometric_sequence_elements(a,r,n) do
   str = for x <- geo_acc(a, r, n, []), into: "" do
     "#{x}, "
    end

    String.trim(str, ", ")
  end
  
  def geo_acc(_a, _r, 0, acc), do: acc
  def geo_acc(a, _r, _n, []), do: geo_acc(a, _r, _n, [a])
  def geo_acc(a,r, n, acc) do
    a = a*r
    geo_acc(a, r, n-1, acc ++ [a])
  end
end
