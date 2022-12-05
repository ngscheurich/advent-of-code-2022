defmodule AdventOfCode.CampCleanupTest do
  use ExUnit.Case

  import AdventOfCode.CampCleanup

  @input """
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8
  """

  test "part_one/1" do
    assert part_one(@input) == 2
  end

  test "part_two/1" do
    assert part_two(@input) == 4
  end
end
