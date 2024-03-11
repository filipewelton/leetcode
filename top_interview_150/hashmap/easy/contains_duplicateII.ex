defmodule ContainsDuplicateII do
  @spec contains_nearby_duplicate(nums :: [integer], k :: integer) :: boolean
  def contains_nearby_duplicate(nums, k) do
    uniq = Enum.uniq(nums)
    repeatable = nums -- uniq
    nums =
      nums
      |> Enum.with_index()
      |> Enum.filter(fn {n, _} -> n in repeatable end)

    reduce(nums, k, 0, 1)
  end

  defp reduce(nums, k, pi, pj) when pj == length(nums) do
    reduce(nums, k, pi + 1, pi + 2)
  end

  defp reduce(nums, _k, pi, _pj) when pi == length(nums), do: false

  defp reduce(nums, k, pi, pj) do
    {i_value, i_index} = Enum.at(nums, pi)
    {j_value, j_index} = Enum.at(nums, pj)
    abs_value = abs(i_index - j_index)

    if i_value == j_value and abs_value <= k do
      true
    else
      reduce(nums, k, pi, pj + 1)
    end
  end
end
