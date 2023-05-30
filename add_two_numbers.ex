# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    do_add_lists(l1, l2, 0, nil)
  end

  defp do_add_lists(nil, nil, 0, res),
    do: res
  defp do_add_lists(nil, nil, acc, res),
    do: do_add_lists(nil, nil, 0, add_node(res, acc))
  defp do_add_lists(nil, %ListNode{val: val, next: next}, acc, res) do
    sum = val + acc
    do_add_lists(next, nil, div(sum, 10), add_node(res, rem(sum, 10)))
  end
  defp do_add_lists(%ListNode{val: val, next: next}, nil, acc, res) do
    sum = val + acc
    do_add_lists(next, nil, div(sum, 10), add_node(res, rem(sum, 10)))
  end
  defp do_add_lists(%ListNode{val: val1, next: next1}, %ListNode{val: val2, next: next2}, acc, res) do
    sum = val1 + val2 + acc

    res =
      case res do
        nil ->
          %ListNode{val: rem(sum, 10), next: nil}

        %ListNode{} = node ->
          add_node(node, sum)
      end

    do_add_lists(next1, next2, div(sum, 10), res)
  end

  defp add_node(%ListNode{val: _val, next: nil} = node, sum),
    do: %{node | next: %ListNode{val: rem(sum, 10), next: nil}}
  defp add_node(%ListNode{val: val, next: next}, sum),
    do: %ListNode{val: val, next: add_node(next, sum)}
end
