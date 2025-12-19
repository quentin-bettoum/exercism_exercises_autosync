defmodule LinkedList do
  @opaque t :: {any(), t} | nil

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: nil

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: {elem, list}

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list), do: count(list, 0)

  defp count(nil, count), do: count
  defp count({_, tail}, count), do: count(tail, count + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(nil), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(nil), do: {:error, :empty_list}
  def peek({head, _tail}), do: {:ok, head}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(nil), do: {:error, :empty_list}
  def tail({_head, tail}), do: {:ok, tail}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(nil), do: {:error, :empty_list}
  def pop({head, tail}), do: {:ok, head, tail}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  # def from_list(list), do: list |> Enum.reduce(new(), &push(&2, &1)) |> reverse()
  def from_list(list), do: list |> from_list(new()) |> reverse()

  defp from_list([], list), do: list
  defp from_list([head | tail], list), do: from_list(tail, push(list, head))

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: list |> reverse |> to_list([])

  defp to_list(nil, list), do: list
  defp to_list({head, tail}, list), do: to_list(tail, [head | list])

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list), do: reverse(list, new())

  defp reverse(nil, list), do: list
  defp reverse({head, tail}, list), do: reverse(tail, push(list, head))
end
