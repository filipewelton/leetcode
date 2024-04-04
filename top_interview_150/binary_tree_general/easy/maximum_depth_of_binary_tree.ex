defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule MaximumDepthOfBinaryTree do
  def build do
    root = %TreeNode{
      val: 1,
      right: %TreeNode{
        val: 2,
      }
    }

    max_depth(root) |> IO.inspect()
  end

  @spec max_depth(root :: TreeNode.t | nil) :: integer
  def max_depth(root) do
    recursive(root, 0)
  end

  defp recursive(nil, depth), do: depth

  defp recursive(%TreeNode{} = node, depth) do
    depth = depth + 1
    dl = recursive(node.left, depth)
    dr = recursive(node.right, depth)

    if dl > dr, do: dl, else: dr
  end
end
