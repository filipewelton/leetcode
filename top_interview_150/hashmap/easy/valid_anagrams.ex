defmodule ValidAnagram do
  @spec is_anagram(s :: String.t(), t :: String.t()) :: boolean
  def is_anagram(s, t) do
    s_chars = String.split(s, "", trim: true) |> Enum.sort()
    t_chars = String.split(t, "", trim: true) |> Enum.sort()
    s_chars == t_chars
  end
end
