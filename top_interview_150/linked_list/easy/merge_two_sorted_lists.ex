defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec merge_two_lists(
          list1 :: ListNode.t() | nil,
          list2 :: ListNode.t() | nil
        ) :: ListNode.t() | nil
  def merge_two_lists(list1, list2) do
    (get_values(list1, []) ++ get_values(list2, []))
    |> Enum.sort()
    |> create_node()
  end

  defp get_values(nil, values), do: values

  defp get_values(%ListNode{} = node, values) do
    values = values ++ [node.val]
    get_values(node.next, values)
  end

  defp create_node([]), do: nil

  defp create_node([head | tail]) do
    %ListNode{
      val: head,
      next: create_node(tail)
    }
  end
end
