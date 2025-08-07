# employees = [
#  %{id: 1, name: "Alice", role: "CEO", manager_id: nil},
#  %{id: 2, name: "Bob", role: "CTO", manager_id: 1},
#  %{id: 3, name: "Charlie", role: "CFO", manager_id: 1},
#  %{id: 4, name: "Dave", role: "Tech Lead", manager_id: 2},
#  %{id: 5, name: "Eve", role: "Developer", manager_id: 4}
# ]

defmodule Calculation.RandomProbs.OrganizationChart do
  def build_tree(employees) do
    [root | _] = Enum.filter(employees, fn e -> is_nil(e.manager_id) end)

    build_node(root, employees)
  end

  def build_node(employee, employees) do
    subordinates =
      employees
      |> Enum.filter(fn e -> e.manager_id == employee.id end)
      |> Enum.map(fn subordinate ->
        build_node(subordinate, employees)
      end)

    Map.put(employee, :subordinate, subordinates)
  end
end
