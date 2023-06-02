defmodule Solution do
  @spec length_of_longest_substring(s :: String.t) :: integer
  def length_of_longest_substring(s) do
    do_search_pattern(s, "", 0)
  end

  defp do_search_pattern("", acc, len),
    do: if String.length(acc) > len, do: String.length(acc), else: len
  defp do_search_pattern(<<char::binary-size(1), rest::binary>>, acc, length) do
    case String.contains?(acc, char) do
      false ->
        do_search_pattern(rest, acc <> char, length)

      true ->
        len = if(length > String.length(acc), do: length, else: String.length(acc))
        resub = trim_repeated_chars(char, acc)
        do_search_pattern(rest, resub, len)
    end
  end

  defp trim_repeated_chars(char, <<char::binary-size(1), rest::binary>>),
    do: rest <> char
  defp trim_repeated_chars(char, <<r::binary-size(1), rest::binary>>),
    do: trim_repeated_chars(char, rest)
end