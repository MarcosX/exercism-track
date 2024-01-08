defmodule LogLevel do
  def to_label(0, false), do: :trace

  def to_label(1, _legacy?), do: :debug

  def to_label(2, _legacy?), do: :info

  def to_label(3, _legacy?), do: :warning

  def to_label(4, _legacy?), do: :error

  def to_label(5, false), do: :fatal

  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      :fatal -> :ops
      :error -> :ops
      :unknown -> alert_unkown(legacy?)
      _ -> false
    end
  end

  defp alert_unkown(true), do: :dev1
  defp alert_unkown(false), do: :dev2
end
