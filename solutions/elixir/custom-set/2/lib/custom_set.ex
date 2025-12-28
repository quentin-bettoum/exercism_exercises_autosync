defmodule CustomSet do
  @opaque t :: %__MODULE__{map: map()}

  defstruct map: %{}

  @spec new(Enum.t()) :: t
  def new(enumerable) do
    map = for item <- enumerable, into: %{}, do: {item, nil}

    %__MODULE__{map: map}
  end

  @spec empty?(t) :: boolean
  def empty?(%__MODULE__{map: set}), do: set == %{}

  @spec contains?(t, any) :: boolean
  def contains?(%__MODULE__{map: set}, element), do: Map.has_key?(set, element)

  @spec subset?(t, t) :: boolean
  def subset?(%__MODULE__{map: set1}, custom_set_2) do
    Enum.all?(set1, fn {el, _} -> contains?(custom_set_2, el) end)
  end

  @spec disjoint?(t, t) :: boolean
  def disjoint?(%__MODULE__{map: set1}, custom_set_2) do
    not Enum.any?(set1, fn {el, _} -> contains?(custom_set_2, el) end)
  end

  @spec equal?(t, t) :: boolean
  def equal?(%__MODULE__{map: set}, %__MODULE__{map: set}), do: true
  def equal?(_, _), do: false

  @spec add(t, any) :: t
  def add(%__MODULE__{map: set}, element), do: %__MODULE__{map: Map.put(set, element, nil)}

  @spec intersection(t, t) :: t
  def intersection(%__MODULE__{map: set1}, custom_set_2) do
    set1
    |> Map.keys()
    |> Enum.filter(fn el -> contains?(custom_set_2, el) end)
    |> new()
  end

  @spec difference(t, t) :: t
  def difference(%__MODULE__{map: set1}, custom_set_2) do
    set1
    |> Map.keys()
    |> Enum.reject(fn el -> contains?(custom_set_2, el) end)
    |> new()
  end

  @spec union(t, t) :: t
  def union(%__MODULE__{map: set1}, %__MODULE__{map: set2}) do
    new(Map.keys(set1) ++ Map.keys(set2))
  end
end
