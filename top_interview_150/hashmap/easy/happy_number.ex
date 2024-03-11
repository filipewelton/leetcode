defmodule HappyNumber do
  @spec is_happy(n :: integer) :: boolean
  def is_happy(n), do: calculate(n, [])

  defp calculate(n, clauses) when n > 1 do
    result =
      Integer.digits(n)
      |> Enum.reduce(0, fn nth, sum -> sum + nth ** 2 end)

    cond do
      clauses == [] ->
        calculate(result, [result])

      result not in clauses ->
        c = List.insert_at(clauses, -1, result) |> Enum.uniq()
        calculate(result, c)

      result in clauses ->
        false
    end
  end

  defp calculate(_n, _clause), do: true
end
