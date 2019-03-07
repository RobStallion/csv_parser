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
      if row_to_list(row) == nil, do: [row_to_list(row) | acc], else: acc
    end)
    |> Enum.reverse()
  end

  defp row_to_list(""), do: nil
  defp row_to_list(str), do: String.split(str, ",")
end
