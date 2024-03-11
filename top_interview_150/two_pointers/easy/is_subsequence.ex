defmodule IsSubsequence do
  @spec is_subsequence(s :: String.t, t :: String.t) :: boolean
  def is_subsequence(s, t) when s == "" and t == "", do: true

  def is_subsequence(s, t) do
    s_letters = String.split(s, "")
    t_letters = String.split(t, "")


    recursion(s_letters, t_letters)
  end

  defp recursion(s_letters, _) when s_letters == [], do: true

  defp recursion(_, t_letters) when t_letters == [], do: false

  defp recursion(s_letters, t_letters) do
    [sx | s_tail] = s_letters
    [tx | t_tail] = t_letters

    if sx == tx do
      recursion(s_tail, t_tail)
    else
      recursion(s_letters, t_tail)
    end
  end
end
