defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type student :: %{name: String.t(), grade: String.t()}
  @type school :: list(student())

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new(), do: []

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    if Enum.any?(school, fn
         %{name: ^name} -> true
         _ -> false
       end) do
      {:error, school}
    else
      {:ok, [%{name: name, grade: grade} | school]}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Stream.filter(fn
      %{grade: ^grade} -> true
      _ -> false
    end)
    |> Stream.map(& &1.name)
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Enum.sort_by(&{&1.grade, &1.name})
    |> Enum.map(fn %{name: name} -> name end)
  end
end
