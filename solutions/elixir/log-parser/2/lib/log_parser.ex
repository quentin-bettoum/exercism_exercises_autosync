defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\])/
  end

  def split_line(line), do: Regex.split(~r/<[~*=-]*>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end-of-line\d+/i, line, "")

  def tag_with_user_name(line) do
    case Regex.named_captures(~r/User\s+(?<name>\S+)/, line) do
      nil -> line
      %{"name" => name} -> "[USER] #{name} #{line}"
    end
  end
end
