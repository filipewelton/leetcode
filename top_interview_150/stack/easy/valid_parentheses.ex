defmodule ValidParentheses do
  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    brackets = String.split(s, "", trim: true)
    validate(brackets, nil)
  end

  defp validate(brackets, stack) when brackets != [] do
    [bracket | brackets] = brackets

    if bracket in ["(", "{", "["] do
      stack = [bracket] ++ (stack || [])
      validate(brackets, stack)
    else
      [open_brackets | stack] = stack || [nil, nil]
      stack = if stack == [], do: nil, else: stack

      if verify_brackets(open_brackets, bracket) do
        validate(brackets, stack)
      else
        false
      end
    end
  end

  defp validate([], nil), do: true

  defp validate(_, _), do: false

  defp verify_brackets("(", ")"), do: true

  defp verify_brackets("{", "}"), do: true

  defp verify_brackets("[", "]"), do: true

  defp verify_brackets(_, _), do: false
end
