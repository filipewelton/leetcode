defmodule PlugsOne do
  @spec plus_one(digits :: [integer]) :: [integer]
  def plus_one(digits) do
    Integer.undigits(digits)
    |> (&(&1 + 1)).()
    |> Integer.digits()
  end
end
