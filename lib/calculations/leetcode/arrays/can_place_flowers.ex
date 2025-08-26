defmodule Calculations.Leetcode.Arrays.CanPlaceflowers do
  require IEx
  def solution(flowerbed, n) do
    len = length(flowerbed) - 1
    values = garden_check(flowerbed, 0)
    values >= n
  end

  def garden_check([], acc), do: acc
  def garden_check([a], acc) when a == 0, do: garden_check([], acc+1)
  def garden_check([1,0], acc),do: garden_check([], acc)
  def garden_check([0,1], acc),do: garden_check([], acc)
  def garden_check([1,1], acc),do: garden_check([], acc)
  def garden_check([0,0], acc),do: garden_check([], acc+1)
  def garden_check([1,0,0], acc),do: garden_check([], acc+1)
  def garden_check([0,0,1], acc),do: garden_check([], acc+1)
 
  def garden_check([h,n,p | t], acc) when h == 1, do: garden_check([n,p|t], acc)
  def garden_check([h,n,p|t], acc) when h == 0 and n == 0 and p == 0 do 
    garden_check([1, p|t], acc+1)
  end
  def garden_check([h,n,p|t], acc), do: garden_check([n,p|t], acc)  
end
