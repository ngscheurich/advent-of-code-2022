defmodule AdventOfCode.RucksackReorganization do
  @moduledoc false

  import AdventOfCode

  def part_one do
    "03_rucksack_reorganization.txt"
    |> read_input()
    |> part_one()
  end

  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&split_compartments/1)
    |> Enum.sum()
  end

  def part_two do
    "03_rucksack_reorganization.txt"
    |> read_input()
    |> part_two()
  end

  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> split_groups()
    |> Enum.map(fn [list | lists] -> find_duplicate(list, lists) end)
    |> Enum.sum()
  end

  defp split_compartments(items), do: split_compartments([], items)

  defp split_compartments(first, items) when length(first) == length(items) do
    find_duplicate(first, [items])
  end

  defp split_compartments(first, items) do
    [item | rest] = items
    split_compartments(first ++ [item], rest)
  end

  defp split_groups(rucksacks), do: split_groups(rucksacks, [])

  defp split_groups([], groups) do
    Enum.map(groups, fn group ->
      Enum.map(group, &String.split(&1, "", trim: true))
    end)
  end

  defp split_groups(rucksacks, groups) do
    [g1, g2, g3 | rest] = rucksacks
    split_groups(rest, groups ++ [[g1, g2, g3]])
  end

  defp find_duplicate(list, lists) do
    [item | rest] = list

    if item_in_lists?(item, lists) do
      priority(item)
    else
      find_duplicate(rest, lists)
    end
  end

  defp item_in_lists?(item, lists) do
    lists
    |> Enum.map(&Enum.member?(&1, item))
    |> Enum.dedup() == [true]
  end

  defp priority(item) do
    case :binary.first(item) do
      n when n >= 97 -> n - 96
      n -> n - 38
    end
  end
end
