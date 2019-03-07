defmodule Csvp do
  # @moduledoc """
  # Documentation for Csvp.
  # """
  #
  # @doc """
  #
  # ## Examples
  #
  #     iex> Csvp.parse()
  #     something..........
  #
  # """

  def parse(file) do
    file
    |> File.read()
    |> split_on_lines()
    |> rows_to_lists()
  end

  defp split_on_lines({:ok, str}), do: {:ok, String.split(str, ~r{(\r\n|\r|\n)})}
  defp split_on_lines({:error, error}), do: {:error, :file.format_error(error)}

  defp rows_to_lists({:ok, rows}) do
    Enum.reduce(rows, [], fn(row, acc) ->
      case split_row_str_into_list_of_cells(row) do
        nil -> acc
        split_row -> [split_row | acc]
      end
    end)
    |> Enum.reverse()
  end

  defp split_row_str_into_list_of_cells(""), do: nil
  defp split_row_str_into_list_of_cells(row_str) do
    charlist = String.to_charlist(row_str)
    # res = Enum.reduce(charlist, [], fn
    #   (34, acc) ->
    #
    #   (char, acc) ->
    #
    # end)

    IO.inspect(charlist ++ 0)
    # IO.inspect(res)
    String.split(row_str, ",")
  end
end
