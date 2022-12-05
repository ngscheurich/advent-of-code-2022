defmodule AdventOfCode.CampCleanup do
  @moduledoc false

  import AdventOfCode

  def part_one do
    "04_camp_cleanup.txt"
    |> read_input()
    |> part_one()
  end

  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, &check_contains/2)
  end

  defp check_contains(pairs, acc) do
    [{min1, max1}, {min2, max2}] = ranges(pairs)

    cond do
      min1 >= min2 && max1 <= max2 -> acc + 1
      min2 >= min1 && max2 <= max1 -> acc + 1
      true -> acc
    end
  end

  def part_two do
    "04_camp_cleanup.txt"
    |> read_input()
    |> part_two()
  end

  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, &check_overlaps/2)
  end

  defp check_overlaps(pairs, acc) do
    [{_, max1}, {min2, _}] =
      pairs
      |> ranges()
      |> Enum.sort(fn {x, _}, {y, _} -> x < y end)

    if max1 >= min2 do
      acc + 1
    else
      acc
    end
  end

  defp ranges(pairs) do
    pairs
    |> String.split(",")
    |> Enum.map(fn range ->
      [min, max] = String.split(range, "-")
      {String.to_integer(min), String.to_integer(max)}
    end)
  end
end
