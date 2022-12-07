defmodule AdventOfCode.TuningTrouble do
  @moduledoc false

  import AdventOfCode

  def part_one, do: "06_tuning_trouble.txt" |> read_input() |> part_one()
  def part_one(input), do: find_marker(input, 4)

  def part_two, do: "06_tuning_trouble.txt" |> read_input() |> part_two()
  def part_two(input), do: find_marker(input, 14)

  defp find_marker(input, length) when is_binary(input) do
    input
    |> String.to_charlist()
    |> find_marker(length)
  end

  defp find_marker(input, length), do: find_marker(input, length, length - 1, false)

  defp find_marker(_input, _length, count, true), do: count

  defp find_marker(input, length, count, false) do
    has_marker = has_marker?(input, length)
    find_marker(tl(input), length, count + 1, has_marker)
  end

  defp has_marker?(list, length) do
    list
    |> Enum.split(length)
    |> elem(0)
    |> Enum.uniq()
    |> length() == length
  end
end
