defmodule Solution do
  require Integer

  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  def find_median_sorted_arrays(nums1, nums2) do
    nums1 ++ nums2
    |> Enum.sort()
    |> do_median()
  end

  defp do_median(arr) do
    case Integer.is_odd(Enum.count(arr)) do
      true -> 
        Enum.at(arr, get_idx(arr) - 1)

      false ->
        even_median(arr)
    end
  end

  defp even_median(arr) do
    val1 = Enum.at(arr, div(Enum.count(arr), 2) - 1)
    val2 = Enum.at(arr, div(Enum.count(arr), 2))
    (val1 + val2) / 2
  end

  defp get_idx(arr),
    do: div((Enum.count(arr) + 1), 2)
end