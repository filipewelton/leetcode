defmodule PalindromeNumber do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    y =
      Integer.digits(x)
      |> Enum.reverse()
      |> Integer.undigits()
      |> abs()

    x == y
  end
end
