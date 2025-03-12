defmodule Recursion.Products do
  # products is a list of a map items
  # products = [
  # %{name: "apple", price: "2,44", quantity: 2},
  # %{name: "orange", price: "3,00", quantity: 9},
  # %{name: "banana", price: "1,20", quantity: 5}
  # ]
  #
  products = [
    %{name: "apple", price: "2,44", quantity: 2},
    %{name: "orange", price: "3,00", quantity: 9},
    %{name: "banana", price: "1,20", quantity: 5}
  ]

  # ugly_version
  def ugly_get_product(inventory, name) do
    Enum.find(inventory, fn product -> product.name == name end)
  end

  #
  # Tail recursion can be a good choice here.

  # my try
  def my_try_get_product([], _name), do: IO.puts("Product not found")

  def my_try_get_product([head | tail], name) do
    case head == name do
      true -> head
      false -> my_try_get_product(tail, name)
    end
  end

  # better version
  def get_product([], _name), do: IO.puts("Product not found")
  # pattern matching and recusion inside function params
  def get_product([%{name: name} = product | _tail], name), do: product
  def get_product([_name | rest], name), do: get_product(rest, name)

  # --------------------------------------------------------------------------------

  # ugly version
  def ugly_update_inventory(inventory, name, amount) do
    Enum.map(inventory, fn product ->
      if product.name == name do
        %{product | quantity: product.quantity - amount}
      else
        product
      end
    end)
  end

  # my try
  def my_try_update_inventory([], _name, _amount), do: IO.puts("Product not found")

  def my_try_update_inventory([%{name: name} = product | _rest], name, amount) do
    product.quantity - amount
  end

  def my_try_update_inventory([_name | rest], name, amount),
    do: my_try_update_inventory(rest, name, amount)

  # better  version

  def update_inventory(inventory, name, amount) do
    update_products(inventory, name, amount, [])
  end

  defp update_products([], _name, _amount, updated_inventory), do: Enum.reverse(updated_inventory)

  defp update_products([%{name: name} = product | rest], name, amount, updated_inventory) do
    update_products(rest, name, amount, [product.quantity - amount | updated_inventory])
  end

  defp update_products([product | rest], name, amount, updated_inventory) do
    updated_product =
      if product.name == name do
        %{product | quantity: product.quantity - amount}
      else
        product
      end

    update_products(rest, name, amount, [updated_product | updated_inventory])
  end
end
