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

  describe "day 4" do
    @input """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """

    test "part one" do
      assert AOC.CampCleanup.part_one(@input) == 2
    end

    test "part two" do
      assert AOC.CampCleanup.part_two(@input) == 4
    end
  end
end
