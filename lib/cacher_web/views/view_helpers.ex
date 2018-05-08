defmodule CacherWeb.ViewHelpers do
  use Phoenix.HTML

  def coordinate(value, type, format \\ :dec_min_sec)
  def coordinate(nil, _, _) do
    ""
  end
  def coordinate(value, type, :dec_min_sec) do
    sphere_name = sphere_name(value, type)
    hour = dec(value)
    minute = minute(value)
    second = sec(value, 3)

    "#{sphere_name} #{hour}° #{minute}' #{second}\""
  end

  def coordinate(value, type, :dec_min) do
    sphere_name = sphere_name(value, type)
    hour = dec(value)
    minute = minute(value, 3)

    "#{sphere_name} #{hour}° #{minute}'"
  end

  defp format(value, precision) do
    value
    |> Float.round(precision)
    |> :erlang.float_to_binary([decimals: precision])
  end

  defp dec(value, precision \\ 0) do
    format(dec_num(value, false), precision)
  end

  defp minute(value, precision \\ 0) do
    format(min_num(value, false), precision)
  end

  defp sec(value, precision \\ 0) do
    format(sec_num(value, false), precision)
  end

  defp dec_num(value, floor \\ true) do
    if floor do
      Float.floor(value)
    else
      value
    end
  end

  defp min_num(value, floor \\ true) do
    minute = value - dec_num(value)
    if floor do
      Float.floor(minute * 60)
    else
      minute * 60
    end
  end

  defp sec_num(value, floor \\ true) do
    second = value - dec_num(value) - (min_num(value) / 60)
    if floor do
      Float.floor(second * 3600)
    else
      second * 3600
    end
  end

  defp sphere_name(value, type) do
    cond do
      type == :lon && value >= 0 -> "E"
      type == :lon && value < 0 -> "W"
      type == :lat && value >= 0 -> "N"
      type == :lat && value < 0 -> "S"
      true -> ""
    end
  end
end
