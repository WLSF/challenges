defmodule Solution do
  def two_sum(nums, target) do
    Enum.reduce_while(nums, {%{}, 0}, fn val, {map, idx} ->
      case Map.get(map, target - val) do
        nil -> {:cont, {Map.put(map, val, idx), idx + 1}}
        idx2 -> {:halt, [idx2, idx]}
      end
    end)
  end

  def two_sum2(nums, target) do
    nums_with_index = Enum.with_index(nums)

    Enum.reduce_while(nums_with_index, [], fn {val, idx} = obj, acc ->
      nums_with_index
      |> Enum.find(fn
        ^obj -> false
        {val2, _} -> val + val2 == target
      end)
      |> case do
        {_val2, idx2} -> {:halt, [idx, idx2]}
        nil -> {:cont, acc}
      end
    end)
  end
end
