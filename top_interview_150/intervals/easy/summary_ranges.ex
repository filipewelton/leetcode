defmodule SummaryRanges do
  @spec summary_ranges(nums :: [integer]) :: [String.t]
  def summary_ranges(nums) when nums == [], do: []

  def summary_ranges(nums) do
    [a, b, intervals] = Enum.reduce(nums, nil, &reduce/2)
    ab = map([a, b])

    Enum.map(intervals, &map/1)
    |> Enum.concat([ab])
  end

  defp reduce(num, nil), do: [num, nil, []]

  defp reduce(num, acc) do
    [a, b, intervals] = acc

    if is_nil(b) do
      if num == (a + 1) do
        [a, num, intervals]
      else
        intervals = List.insert_at(intervals, -1, [a, b])
        [num, nil, intervals]
      end
    else
      if num == (b + 1) do
        [a, num, intervals]
      else
        intervals = List.insert_at(intervals, -1, [a, b])
        [num, nil, intervals]
      end
    end
  end

  defp map([a, nil]), do: to_string(a)

  defp map([a, b]), do: "#{a}->#{b}"
end

SummaryRanges.summary_ranges([])
|> IO.inspect()
