defmodule Solution do
  @spec merge_two_lists(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) ::
          ListNode.t() | nil
  def merge_two_lists(list1, list2) do
    mg_lists(list1, list2, [])
  end

  defp mg_lists([h1 | t1], [h2 | t2], acc) do
    mg_lists(t1, t2, acc ++ [h1] ++ [h2])
  end

  defp mg_lists([], [], acc), do: acc
  defp mg_lists([a], [], acc), do: acc ++ [a]
  defp mg_lists([], [b], acc), do: acc ++ [b]
end
