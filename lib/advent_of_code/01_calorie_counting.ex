defmodule AdventOfCode.CalorieCounting do
  @moduledoc false

  import AdventOfCode

  def process(count \\ 1) do
    "01_calorie_counting.txt"
    |> read_input()
    |> to_lists()
    |> sum_lists()
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(count)
    |> Enum.sum()
  end

  defp to_lists(text) do
    text
    |> String.split("\n\n")
    |> Enum.map(&to_integers/1)
  end

  defp to_integers(values) do
    values
    |> String.split("\n")
    |> Enum.reduce([], &integer_reducer/2)
  end

  defp integer_reducer("", acc), do: acc
  defp integer_reducer(cur, acc), do: acc ++ [String.to_integer(cur)]

  defp sum_lists(lists) do
    Enum.map(lists, &Enum.sum/1)
  end
end
