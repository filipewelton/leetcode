defmodule IsomorphicStrings do
  @spec is_isomorphic(s :: String.t(), t :: String.t()) :: boolean
  def is_isomorphic(s, t) do
    s_chars = String.split(s, "", trim: true)
    t_chars = String.split(t, "", trim: true)
    s_indexer = set_id(s_chars, %{}, 0)
    t_indexer = set_id(t_chars, %{}, 0)
    s_pattern = Enum.map(s_chars, &Map.get(s_indexer, &1))
    t_pattern = Enum.map(t_chars, &Map.get(t_indexer, &1))

    s_pattern == t_pattern
  end

  defp set_id(chars, map, weight) when chars != [] do
    [head | tail] = chars
    w = Map.get(map, head)

    if is_nil(w) do
      updated_map = Map.put(map, head, weight)
      set_id(tail, updated_map, weight + 1)
    else
      set_id(tail, map, weight)
    end
  end

  defp set_id(_chars, map, _weight), do: map
end
