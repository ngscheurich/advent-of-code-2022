defmodule AdventOfCode.SupplyStacks do
  @moduledoc false

  import AdventOfCode

  def part_one do
    "05_supply_stacks.txt"
    |> read_input()
    |> part_one()
  end

  def part_one(input) do
    model = :cm9000
    stacks = parse_stacks(input)

    input
    |> parse_moves()
    |> move_crates(stacks, model)
    |> generate_output()
  end

  def part_two do
    "05_supply_stacks.txt"
    |> read_input()
    |> part_two()
  end

  def part_two(input) do
    model = :cm9001
    stacks = parse_stacks(input)

    input
    |> parse_moves()
    |> move_crates(stacks, model)
    |> generate_output()
  end

  defp parse_stacks(input) do
    [crate_data, key_data] =
      input
      |> String.split("\n\n")
      |> List.first()
      |> String.split("\n ")

    crates = parse_crates(crate_data)

    key_data
    |> parse_keys()
    |> build_stacks(crates)
  end

  defp parse_crates(data) do
    data
    |> String.split("\n")
    |> Enum.map(&parse_row/1)
  end

  defp parse_row(row) do
    row
    |> String.split("    ")
    |> Enum.flat_map(&String.split(&1, " "))
  end

  defp parse_keys(data) do
    String.split(data, ~r/ +/, trim: true)
  end

  defp build_stacks(keys, grid) do
    Enum.reduce(keys, %{}, fn key, acc ->
      pos = String.to_integer(key) - 1

      stack =
        Enum.reduce(grid, [], fn row, acc ->
          case Enum.at(row, pos) do
            "" -> acc
            val -> acc ++ [val]
          end
        end)

      Map.put(acc, key, stack)
    end)
  end

  defp parse_moves(input) do
    input
    |> String.split("\n\n")
    |> List.last()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_move/1)
  end

  defp parse_move(data) do
    [_, count, from, to] =
      ~r/move (\d+) from (\d+) to (\d+)/
      |> Regex.scan(data)
      |> List.flatten()

    {count, from, to}
  end

  defp move_crates([], stacks, _model), do: stacks

  defp move_crates([move | moves], stacks, model) do
    {count, from, to} = move

    stack_from = Map.fetch!(stacks, from)
    stack_to = Map.fetch!(stacks, to)

    {crates_to_move, crates_left} = Enum.split(stack_from, String.to_integer(count))
    moved_crates = if model == :cm9001, do: crates_to_move, else: Enum.reverse(crates_to_move)

    stacks =
      stacks
      |> Map.put(to, moved_crates ++ stack_to)
      |> Map.put(from, crates_left)

    move_crates(moves, stacks, model)
  end

  defp generate_output(stacks) do
    stacks
    |> Map.values()
    |> Enum.reduce("", fn stack, output ->
      case stack do
        [] ->
          output

        [crate | _] ->
          "[" <> <<letter::binary-size(1)>> <> "]" = crate
          output <> letter
      end
    end)
  end
end
