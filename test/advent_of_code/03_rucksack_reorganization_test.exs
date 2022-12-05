defmodule AdventOfCode.RucksackReorganizationTest do
  use ExUnit.Case

  import AdventOfCode.RucksackReorganization

  @input """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "part_one/1" do
    assert part_one(@input) == 157
  end

  test "part_two/1" do
    assert part_two(@input) == 70
  end
end
