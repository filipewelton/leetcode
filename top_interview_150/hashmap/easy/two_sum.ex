defmodule TwoSum do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    reduce(nums, %{}, target, 0)
  end

  defp reduce(nums, results, target, index) when index < length(nums) do
    num = Enum.at(nums, index)
    subtraction = target - num
    match_index = Map.get(results, subtraction)

    if is_nil(match_index) do
      results = Map.put(results, num, index)
      reduce(nums, results, target, index + 1)
    else
      sum = num + Enum.at(nums, match_index)

      if sum == target do
        [match_index, index]
      else
        results = Map.put(results, num, index)
        reduce(nums, results, target, index + 1)
      end
    end
  end

  defp reduce(_nums, _results, _target, _index), do: [0, 1]
end
