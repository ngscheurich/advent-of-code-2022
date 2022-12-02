defmodule AdventOfCodeTest do
  use ExUnit.Case

  alias AdventOfCode, as: AOC

  describe "day 2" do
    @input """
    A Y
    B X
    C Z
    """

    test "part one" do
      assert AOC.RockPaperScissors.part_one(@input) == 15
    end

    test "part two" do
      assert AOC.RockPaperScissors.part_two(@input) == 12
    end
  end
end
