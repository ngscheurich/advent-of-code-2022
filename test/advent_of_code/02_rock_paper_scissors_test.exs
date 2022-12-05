defmodule AdventOfCode.RockPaperScissorsTest do
  use ExUnit.Case

  import AdventOfCode.RockPaperScissors

  @input """
  A Y
  B X
  C Z
  """

  test "part_one/1" do
    assert part_one(@input) == 15
  end

  test "part_two/1" do
    assert part_two(@input) == 12
  end
end
