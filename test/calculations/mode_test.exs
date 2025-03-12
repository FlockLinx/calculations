defmodule Calculations.ModeTest do
  use ExUnit.Case
  alias Calculations.CentralTendency.Mode

  test "valid mode" do
    assert Mode.mode([1, 2, 3, 1, 2, 3, 4, 5, 6, 7, 2, 3, 5, 2, 1, 4, 6, 7, 8, 5, 8]) == [2]
  end

  test "invalid mode" do
    assert Mode.mode([2]) == nil
  end
end
