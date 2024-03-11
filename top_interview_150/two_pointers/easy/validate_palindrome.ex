defmodule ValidPalindrome do
  @spec is_palindrome(s :: String.t) :: boolean
  def is_palindrome(s) when s == " ", do: true

  def is_palindrome(s) do
    chars =
      String.trim(s)
      |> String.downcase()
      |> String.split("")
      |> Enum.filter(fn char ->
        if Regex.match?(~r/[a-z0-9]/, char), do: true, else: false
      end)
    backward = Enum.reverse(chars) |> Enum.join()
    forward = Enum.join(chars)

    forward == backward
  end
end
