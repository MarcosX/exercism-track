defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    discount_rate = (100 - discount) / 100
    before_discount * discount_rate
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * 22)
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    (budget / daily_rate)
    |> Float.floor(1)
  end
end
