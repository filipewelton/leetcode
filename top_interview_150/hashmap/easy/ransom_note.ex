defmodule Ransom do
  @spec can_construct(ransom_note :: String.t, magazine :: String.t) :: boolean
  def can_construct(ransom_note, magazine) do
    ransom_letters =
      String.split(ransom_note, "")
      |> Enum.filter(&(&1 != ""))

    magazine_letters =
      String.split(magazine, "")
      |> Enum.filter(&(&1 != ""))

    letters = ransom_letters -- magazine_letters

    letters == []
  end
end
