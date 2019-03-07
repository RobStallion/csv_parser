defmodule CsvpTest do
  use ExUnit.Case
  doctest Csvp

  test "Csvp.parse returns a list" do
    assert is_list(Csvp.parse("postcode.csv"))
  end

  test "Csvp.parse correctly parses cells that contain a comma" do
    Csvp.parse("comma_in_cell.csv")
    |> IO.inspect(label: "===> ")
  end
end
