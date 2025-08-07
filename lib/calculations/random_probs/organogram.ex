defmodule Calculations.RandomProbs.Organogram do
  def solution(employees) do
    # preciso encontrar o CEO
    [root | _t] = Enum.filter(employees, fn x -> is_nil(x.manager_id) end)
    rec(root, employees)
  end

  def rec(employee, employees) do
    subordinates =
      employees
      |> Enum.filter(fn x -> x.manager_id == employee.id end)
      |> Enum.map(fn subordinate ->
        rec(subordinate, employees)
      end)

    Map.put(employee, :subordinates, subordinates)
  end
end
