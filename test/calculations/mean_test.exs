defmodule Calculations.MeanTest do
  use ExUnit.Case
  alias Calculations.CentralTendency.Mean

  test "population mean empty list" do
    assert Mean.population_mean([]) == {:error, "Invalid data type"}
  end

  test "population mean" do
    assert Mean.population_mean([10, 20, 30]) == 20.0
  end

  test "population mean refute" do
    refute Mean.population_mean([10, 20, 30]) == 10.0
  end

  test "sample mean empty list" do
    assert Mean.sample_mean([]) == {:error, "Invalid data type"}
  end

  test "sample mean not integer list" do
    assert Mean.sample_mean(["a", "b", "c"]) == {:error, "Invalid data type"}
  end

  test "sample mean" do
    assert Mean.sample_mean([10, 20, 30]) == 20.0
  end

  test "sample mean refute" do
    refute Mean.sample_mean([10, 20, 30]) == 10.0
  end
end
