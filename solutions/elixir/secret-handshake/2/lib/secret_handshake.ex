defmodule SecretHandshake do
  @actions %{
    0b00001 => "wink",
    0b00010 => "double blink",
    0b00100 => "close your eyes",
    0b01000 => "jump",
    0b10000 => :reverse,
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    import Bitwise, only: [&&&: 2]

    Enum.reduce(@actions, [], fn
      {b, :reverse}, acc when (code &&& b) > 0 -> Enum.reverse(acc)
      {b, action}, acc when (code &&& b) > 0 -> acc ++ [action]
      {_, _}, acc -> acc
    end)
  end
end
