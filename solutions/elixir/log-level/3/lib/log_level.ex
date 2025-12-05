defmodule LogLevel do
  @type log_level() :: pos_integer() | :error | :fatal | :unknown
  @type legacy?() :: boolean()
  @type label() :: :trace | :debug | :info | :warning | :error | :fatal | :unknown
  @type recipient() :: :ops | :dev1 | :dev2

  @spec to_label(log_level(), legacy?()) :: label()
  def to_label(0, false), do: :trace
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(_, _), do: :unknown

  @spec alert_recipient(log_level(), legacy?()) :: recipient() | false
  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      l when l in [:error, :fatal] -> :ops
      :unknown when legacy? -> :dev1
      :unknown when not legacy? -> :dev2
      _ -> false
    end
  end
end
