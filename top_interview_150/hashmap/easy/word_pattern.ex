defmodule WordPattern do
  @spec word_pattern(pattern :: String.t(), s :: String.t()) :: boolean
  def word_pattern(pattern, s) do
    i =
      String.split(pattern, "", trim: true)
      |> Enum.with_index()
      |> Enum.reduce(%{}, &reduce/2)
      |> Map.values()

    j = String.split(s, " ", trim: true)

    if String.length(pattern) != length(j) do
      false
    else
      compare(i, j, [])
    end
  end

  defp reduce({char, index}, map) do
    c = Map.get(map, char, []) ++ [index]
    Map.put(map, char, c)
  end

  defp compare(pointers, words, removed_words) when pointers != [] do
    [head | tail] = pointers

    comparisons =
      Enum.map(head, &Enum.at(words, &1))
      |> Enum.uniq()

    w = List.first(comparisons)

    if length(comparisons) == 1 and w not in removed_words do
      words = remove(words, head)
      removed_words = List.insert_at(removed_words, -1, w)

      compare(tail, words, removed_words)
    else
      false
    end
  end

  defp compare(_pointers, words, _removed_words) do
    result = Enum.uniq(words) |> length()
    result == 1
  end

  defp remove(chars, indexes) do
    Enum.reduce(indexes, chars, fn index, acc -> List.replace_at(acc, index, nil) end)
  end
end
