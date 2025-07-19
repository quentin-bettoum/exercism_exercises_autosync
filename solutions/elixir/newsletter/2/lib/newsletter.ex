defmodule Newsletter do
  def read_emails(path), do: path |> File.read!() |> String.split()

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)
    read_emails(emails_path) |> send_emails(log_pid, send_fun)
    close_log(log_pid)
  end

  defp send_emails([], _, _), do: :ok
  defp send_emails([mail | rest], log_pid, send_fun) do
    if send_fun.(mail) == :ok, do: log_sent_email(log_pid, mail)
    send_emails(rest, log_pid, send_fun)
  end
end
