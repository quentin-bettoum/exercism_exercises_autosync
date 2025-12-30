defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

      iex> Markdown.parse("This is a paragraph")
      "<p>This is a paragraph</p>"

      iex> Markdown.parse("# Header!\\n* __Bold Item__\\n* _Italic Item_")
      "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    patch(Enum.join(Enum.map(String.split(m, "\n"), fn t -> process(t) end)))
  end

  defp parse_header(line) do
    with [_, hashes, rest] <- Regex.run(~r/^(\#{1,6})\s(.*)/, line) do
      {byte_size(hashes), rest}
    end
  end

  defp list?(line), do: String.starts_with?(line, "*")

  defp process(line) do
    cond do
      header = parse_header(line) ->
        enclose_with_header_tag(header)

      list?(line) ->
        parse_list_md_level(line)

      true ->
        line |> String.split() |> enclose_with_paragraph_tag()
    end
  end

  defp parse_list_md_level(str) do
    str
    |> String.split()
    |> tl() # Avoids having to trim the first "* "
    |> join_words_with_tags()
    |> then(&"<li>#{&1}</li>")
  end

  defp enclose_with_header_tag({header_level, line}) do
    "<h#{header_level}>#{line}</h#{header_level}>"
  end

  defp enclose_with_paragraph_tag(str) do
    "<p>#{join_words_with_tags(str)}</p>"
  end

  defp join_words_with_tags(str) do
    str
    |> Enum.map(&replace_md_with_tag/1)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(str) do
    str |> replace_prefix_md() |> replace_suffix_md()
  end

  defp replace_prefix_md(str) do
    cond do
      str =~ ~r/^#{"__"}{1}/ -> String.replace(str, ~r/^#{"__"}{1}/, "<strong>", global: false)
      str =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(str, ~r/_/, "<em>", global: false)
      true -> str
    end
  end

  defp replace_suffix_md(str) do
    cond do
      str =~ ~r/#{"__"}{1}$/ -> String.replace(str, ~r/#{"__"}{1}$/, "</strong>")
      str =~ ~r/[^#{"_"}{1}]/ -> String.replace(str, ~r/_/, "</em>")
      true -> str
    end
  end

  defp patch(str) do
    with [_, content] <- Regex.run(~r[(<li>.*</li>)], str) do
      String.replace(str, content, "<ul>#{content}</ul>")
    else
      nil -> str
    end
  end
end
