defmodule ValidatorTest do
  use ExUnit.Case
  alias Calculations.Validators

  test "validate integer list" do
    assert Validators.validate_num_list([1, 2, 3]) == {true, [1, 2, 3]}
  end

  test "validate not integer list" do
    assert Validators.validate_num_list(["a", "b", 3]) == {false, ["a", "b", 3]}
  end

  test "validate not a list" do
    assert Validators.validate_num_list("3") == {:error, "Invalid data type"}
  end
end
