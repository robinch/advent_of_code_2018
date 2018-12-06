defmodule Day5 do
  def solve() do
    File.stream!("input.txt")
    |> Stream.map(&String.to_charlist/1)
    |> Enum.to_list()
    |> hd()
    |> Enum.reduce(_stack = [], fn
      unit, [] ->
        [unit]

      unit, stack = [stored_unit | rest] ->
        if same_type_opposite_polarity?(stored_unit, unit) do
          rest
        else
          [unit | stack]
        end
    end)
    |> length()
  end

  def same_type_opposite_polarity?(unit1, unit2) do
    abs(unit1 - unit2) == 32
  end
end
