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

  describe "day 3" do
    @input """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """

    test "part one" do
      assert AOC.RucksackReorganization.part_one(@input) == 157
    end

    test "part two" do
      assert AOC.RucksackReorganization.part_two(@input) == 70
    end
  end
end
