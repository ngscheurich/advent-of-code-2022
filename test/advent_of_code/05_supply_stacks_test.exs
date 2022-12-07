defmodule AdventOfCode.SupplyStacksTest do
  use ExUnit.Case

  import AdventOfCode.SupplyStacks

  @input """
      [D]    
  [N] [C]    
  [Z] [M] [P]
   1   2   3 

  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2
  """

  test "part_one/1" do
    assert part_one(@input) == "CMZ"
  end

  test "part_two/1" do
    assert part_two(@input) == "MCD"
  end
end
