defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec count_nodes(root :: TreeNode.t() | nil) :: integer
  def count_nodes(root) when root == [], do: 0

  def count_nodes(root) when length(root) == 1, do: 0

  def count_nodes(root), do: count(root, 0)

  defp count(nil, counter), do: counter

  defp count(%TreeNode{} = node, counter) do
    counter = count(node.left, counter + 1)
    count(node.right, counter)
  end
end

