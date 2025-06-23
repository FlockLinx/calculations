defmodule Calculations.Ctci.ArraysStrings do
  # 1.1 - if a string has all unique characters
  # base case - [] 
  # recursive case when h != n do it again
  # i need to compare h with n an then move to other step to compare
  # 

  # My solution
  def has_unique(string) do
    st_list = string |> String.split("", trim: true)
    verify_unique(st_list, [])
  end

  # def verify_unique(list), do: verify_unique(list, nil)
  # def verify_unique([], _item), do: []
  # def verify_unique([h|t], nil), do: verify_unique(t, h)
  # def verify_unique([h | t ], item) when h == item, do: false
  # def verify_unique([h | t ], item) when h != item, do: verify_unique(t, h) 

  # right solution
  # I need to put all checked itens on seen list, thats the catch
  def verify_unique([], _seen), do: true

  def verify_unique([h | t], seen) do
    if h in seen do
      false
    else
      verify_unique(t, [h | seen])
    end
  end
end
