defmodule Calculations.Codewars.ShortLongShort do
  def solution(a, b) do
    al = String.length(a)
    bl = String.length(b)

    if(al > bl) do
      b <> a <> b
    else
      a <> b <> a
    end
  end
end
