defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size > 0 do
    s
    |> String.split("", trim: true)
    |> slices(size, [])
    |> Enum.reverse()
  end

  def slices(_s, _size), do: []

  defp slices([_head | tail] = s, size, acc) when length(s) >= size do
    slices(tail, size, [Enum.take(s, size) |> Enum.join("") | acc ])
  end

  defp slices(_s, _size, acc), do: acc
end
