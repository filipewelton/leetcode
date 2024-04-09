defmodule GroupAnagrams do
  @spec group_anagrams(strs :: [String.t()]) :: [[String.t()]]
  def group_anagrams(strs) when length(strs) == 1, do: [strs]

  def group_anagrams(strs) do
    Enum.reduce(strs, %{}, fn str, map ->
      k =
        String.split(str, "", trim: true)
        |> Enum.sort()
        |> Enum.join()

      if Map.has_key?(map, k) do
        Map.update!(map, k, &(&1 ++ [str]))
      else
        Map.put(map, k, [str])
      end
    end)
    |> Map.values()
    |> Enum.sort(&(length(&1) < length(&2)))
  end
end
