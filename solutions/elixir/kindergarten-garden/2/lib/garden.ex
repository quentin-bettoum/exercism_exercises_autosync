defmodule Garden do
  @students [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @plants %{"G" => :grass, "C" => :clover, "R" => :radishes, "V" => :violets}

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    student_names = Enum.sort(student_names)

    Enum.reduce(student_names, %{}, fn s, acc ->
      student_index = 2 * Enum.find_index(student_names, &(&1 == s))

      plants =
        info_string
        |> String.split("\n")
        |> Enum.flat_map(fn line ->
          line
          |> String.graphemes()
          |> Enum.slice(student_index..(student_index + 1))
          |> Enum.map(&@plants[&1])
        end)
        |> List.to_tuple()

      Map.put(acc, s, plants)
    end)
  end
end
