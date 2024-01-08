defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    squared_distance_to_center = x * x + y * y

    cond do
      squared_distance_to_center <= 1 -> 10
      squared_distance_to_center <= 25 -> 5
      squared_distance_to_center <= 100 -> 1
      true -> 0
    end
  end
end
