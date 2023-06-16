defmodule Solution do
  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do
    validate_str(s)
  end

  defp validate_str(str),
    do: do_validate_str(str, [])

  defp do_validate_str("", stack),
    do: stack == []
  defp do_validate_str(<<_char::binary-size(1)>>, []),
    do: false
  defp do_validate_str(<<char::binary-size(1), rest::binary>>, stack) do
    res = 
    case char in ["(", "{", "["] do
      true ->
        [char | stack]

      false ->
        check(char, stack)
    end

    unless res == stack, do: do_validate_str(rest, res), else: false
  end

  defp check(")", ["(" | t]),
    do: t
  defp check(")", t),
    do: t
  defp check("}", ["{" | t]),
    do: t
  defp check("}", t),
    do: t
  defp check("]", ["[" | t]),
    do: t
  defp check("]", t),
    do: t
end