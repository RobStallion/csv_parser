defmodule CsvpTest do
  use ExUnit.Case
  doctest Csvp

  test "Csvp.parse returns a list" do
    assert is_list(Csvp.parse("postcode.csv"))
  end
end
