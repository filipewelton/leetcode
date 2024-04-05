defmodule Solution do
  @spec longest_consecutive(nums :: [integer]) :: integer
  def longest_consecutive(nums) do
    if nums == [] do
      0
    else
      {_, length1, length2} =
        Enum.sort(nums)
        |> Enum.uniq()
        |> Enum.reduce({nil, 0, 0}, &reduce/2)

      max(length1, length2)
    end
  end

  defp reduce(n, {nil, length1, length2}), do: {n, length1, length2 + 1}

  defp reduce(n, {before, length1, length2}) do
    if n == before + 1 do
      {n, length1, length2 + 1}
    else
      if length2 >= length1 do
        {n, length2, 1}
      else
        {n, length1, 1}
      end
    end
  end
end
