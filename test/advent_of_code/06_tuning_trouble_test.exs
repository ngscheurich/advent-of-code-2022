defmodule AdventOfCode.TuningTroubleTest do
  use ExUnit.Case

  import AdventOfCode.TuningTrouble

  @input """
  mjqjpqmgbljsphdztnvjfqwrcgsmlb
  """

  test "part_one/1", do: assert(part_one(@input) == 7)
  test "part_two/1", do: assert(part_two(@input) == 19)
end
