defmodule SpaceAge do
  @earth_years_ratio_to %{
    :mercury => 0.2408467,
    :venus => 0.61519726,
    :earth => 1,
    :mars => 1.8808158,
    :jupiter => 11.862615,
    :saturn => 29.447498,
    :uranus => 84.016846,
    :neptune => 164.79132
  }
  @seconds_in_earth_year 31_557_600
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    (seconds/@seconds_in_earth_year)/@earth_years_ratio_to[planet]
  end
end
