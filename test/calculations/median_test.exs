defmodule Calculations.MedianTest do
  use ExUnit.Case

  alias Calculations.CentralTendency.Median

  test "median odd" do
    assert Median.median([10, 20, 30, 40, 50]) == 30
  end

  test "median even" do
    assert Median.median([10, 20, 30, 90, 40, 50]) == 35
  end

  test "median empty list" do
    assert Median.median("a") == {:error, "Invalid data type"}
  end

  test "median fail if it`s not a list" do
    assert Median.median(["a", 20, 30, 90, 40, 50]) == {:error, "Invalid data type"}
  end
end
