defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec get_minimum_difference(root :: TreeNode.t() | nil) :: integer
  def get_minimum_difference(root) do
    traverse(root, [])
    |> Enum.sort(:desc)
    |> calculate_differences(nil)
  end

  defp traverse(nil, values), do: values

  defp traverse(%TreeNode{} = node, values) do
    values = if node.val in values, do: values, else: values ++ [node.val]
    values = traverse(node.left, values)
    traverse(node.right, values)
  end

  defp calculate_differences(list, minimal_difference) when length(list) == 1,
    do: minimal_difference

  defp calculate_differences(list, minimal_difference) do
    [head | tail] = list
    m = Enum.map(tail, &(head - &1)) |> Enum.min()

    minimal_difference =
      cond do
        is_nil(minimal_difference) -> m
        m < minimal_difference -> m
        true -> minimal_difference
      end

    calculate_differences(tail, minimal_difference)
  end
end

"""
[4,2,1,3,6]
4-2
4-1
"""
