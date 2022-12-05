defmodule AdventOfCode.RockPaperScissors do
  @moduledoc false

  import AdventOfCode

  def part_one do
    "02_rock_paper_scissors.txt"
    |> read_input()
    |> part_one()
  end

  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  def part_two do
    "02_rock_paper_scissors.txt"
    |> read_input()
    |> part_two()
  end

  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&complete_round/1)
    |> Enum.sum()
  end

  defp score_round(round) do
    [theirs, mine] = String.split(round, " ")
    score(theirs, mine)
  end

  defp score(theirs, mine) do
    move2points(mine) + bonus_points(mine, theirs)
  end

  defp complete_round(round) do
    [theirs, outcome] = String.split(round, " ")
    mine = move_needed(theirs, outcome)
    move2points(mine) + bonus_points(mine, theirs)
  end

  # Rock
  def move_needed("A", o) do
    cond do
      o == "X" -> named_move(:scissors)
      o == "Y" -> named_move(:rock)
      o == "Z" -> named_move(:paper)
    end
  end

  # Paper
  def move_needed("B", o) do
    cond do
      o == "X" -> named_move(:rock)
      o == "Y" -> named_move(:paper)
      o == "Z" -> named_move(:scissors)
    end
  end

  # Scissors
  def move_needed("C", o) do
    cond do
      o == "X" -> named_move(:paper)
      o == "Y" -> named_move(:scissors)
      o == "Z" -> named_move(:rock)
    end
  end

  defp move2points(v) when v in ~w(A X), do: 1
  defp move2points(v) when v in ~w(B Y), do: 2
  defp move2points(v) when v in ~w(C Z), do: 3

  defp named_move(:rock), do: "A"
  defp named_move(:paper), do: "B"
  defp named_move(:scissors), do: "C"

  def bonus_points(m, t) when m in ~w(A X) do
    cond do
      t == "A" -> 3
      t == "C" -> 6
      true -> 0
    end
  end

  def bonus_points(m, t) when m in ~w(B Y) do
    cond do
      t == "B" -> 3
      t == "A" -> 6
      true -> 0
    end
  end

  def bonus_points(m, t) when m in ~w(C Z) do
    cond do
      t == "C" -> 3
      t == "B" -> 6
      true -> 0
    end
  end
end
