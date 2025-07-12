defmodule Calculations.Codewars.Leetcode.Arrays.ClosestToZero do
  # caso base array esta vazio e tenho o numero mais prox de zero
  # so tenho um ultimo numero no array, retorna o numero *
  # 
  # caso recursivo.
  # coloquei esse numero em n o proximo eh menor que seu modulo  ou igual se for menor colocar ele em n 
  def find_close([], acc \\ nil), do: acc
  def find_close([h, n | t], acc) when h <= n, do: find_close(t, h)
  def find_close([h, n | t], acc) when h < 0 do
    case h*(-1) <= n do
      true -> find_close(t, h)
      false -> find_close(t, n)
    end
  end
  def find_close([h,n|t], acc) when h > n, do: find_close(t,n)
  def find_close([h], acc) when h < acc, do: h
  def find_close([h], acc) when h > acc, do: acc

  #encontrar min numb
  def find_closest_number([n]), do: n
  def find_closest_number([h,n|t]) when h < 0 and n < 0 do
    case h*(-1) < n*(-1) do
      true -> find_closest_number(t ++ [h])
      false -> find_closest_number(t ++ [n])
    end
  end
  def find_closest_number([h,n|t]) when h < 0 do
    if(h*(-1) == n) do
      find_closest_number(t++[n])
    end
    case h*(-1) < n do
      true -> find_closest_number(t ++ [h])
      false -> find_closest_number(t ++ [n])
    end
  end

  def find_closest_number([h,n|t]) when n < 0 do
    if(n*(-1) == h) do
      find_closest_number(t++[h])
    end
    case n*(-1) > h do
      true -> find_closest_number(t++[n])
      false -> find_closest_number(t++[h])
    end
  end
  def find_closest_number([h,n|t]) when h > 0 and h < n, do: find_closest_number(t ++ [h])
  def find_closest_number([h, n|t]) when h > 0 and h > n,  do: find_closest_number(t ++ [n])


  #Start over.
  # se eu usar um acc que recebe o menor numero encontrado, eu comparo do H com ele se for negativo transformo
  # com modulo se forem iguais pego o positivo.
  # o acc comeca em 0, o caso recursivo eh []


  def find_clos([h|t], acc \\ 0) when acc == 0, do: find_clos(t, h)
  def find_clos([h|t], acc) when h < 0 and acc < 0 do
    case h < acc do
      true -> find_clos(t, acc)
      false -> find_clos(t, h)
    end
  end

  def find_clos([h|t], acc) when h < 0 and acc > 0 do
    if h*(-1) == acc do
      find_clos(t, acc)
    end

    case h*(-1) < acc do
      true -> find_clos(t,h)
      false -> find_clos(t,acc)
    end
  end

  def find_clos([h|t], acc) when h > 0 and acc < 0 do
    if acc*(-1) == h do
      find_clos(t, h)
    end

    case h < acc*(-1) do
      true -> find_clos(t,h)
      false -> find_clos(t, acc)
    end
  end

  def find_clos([h|t], acc) when h > 0 and h > acc, do: find_clos(t, acc)
   
  def find_clos([n], acc) when n > 0 and acc > 0 do
    case n < acc do
      true -> n
      false -> acc
    end
  end


  def find_clos([n], acc) when n < 0 and acc < 0 do
    case n > acc do
      true -> n
      false -> acc
    end
  end

  def find_clos([n], acc) when n < 0 and acc > 0 do
    if n*(-1) == acc do
      acc
    end

    if n*(-1) > acc do
      acc
    end

    if n*(-1) < acc do
      n
    end
  end

  def find_clos([n], acc) when n > 0 and acc < 0 do
    if acc*(-1) == n do
      n
    end

    if acc*(-1) > n do
      n
    end

    if acc*(-1) < n do
      acc
    end
  end

end
