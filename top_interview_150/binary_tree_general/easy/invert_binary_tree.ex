defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule InvertBinaryTree do
  @spec invert_tree(root :: TreeNode.t | nil) :: TreeNode.t | nil
  def invert_tree(root) when not is_nil(root) or root == [] do
    %TreeNode{left: left, right: right, val: val} = root

    cond do
      is_nil(left) and is_nil(right) ->
        root

      is_nil(left) and not is_nil(right) ->
        r = invert_tree(right)
        %TreeNode{val: val, left: r, right: nil}

      not is_nil(left) and is_nil(right) ->
        l = invert_tree(left)
        %TreeNode{val: val, left: nil, right: l}

      true ->
        l = invert_tree(left)
        r = invert_tree(right)
        %TreeNode{val: val, left: r, right: l}
    end
  end

  def invert_tree(_root), do: nil
end
