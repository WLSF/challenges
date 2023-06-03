defmodule Solution do
  @spec roman_to_int(s :: String.t) :: integer
  def roman_to_int(s) do
    generate_int(s)
  end

  defp generate_int(<<h::binary-size(1), t::binary>>) do
    generate_int(t, h, translate(h))
  end

  defp generate_int(<<>>, _, acc), 
    do: acc
  defp generate_int(<<h::binary-size(1), t::binary>>, h, acc),
    do: generate_int(t, h, acc + translate(h))
  defp generate_int(<<h::binary-size(1), t::binary>>, "I", acc) when h in ["V", "X"],
    do: generate_int(t, h, acc + (translate(h) - 2))
  defp generate_int(<<h::binary-size(1), t::binary>>, "X", acc) when h in ["L", "C"],
    do: generate_int(t, h, acc + (translate(h) - 20))
  defp generate_int(<<h::binary-size(1), t::binary>>, "C", acc) when h in ["D", "M"],
    do: generate_int(t, h, acc + (translate(h) - 200))
  defp generate_int(<<h::binary-size(1), t::binary>>, _, acc),
    do: generate_int(t, h, acc + translate(h))

  defp translate("I"), do: 1
  defp translate("V"), do: 5
  defp translate("X"), do: 10
  defp translate("L"), do: 50
  defp translate("C"), do: 100
  defp translate("D"), do: 500
  defp translate("M"), do: 1000
end