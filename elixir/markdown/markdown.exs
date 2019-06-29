defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown_text) do
    markdown_text
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.join()
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end

  defp parse_line(line) do
    cond do
      String.starts_with?(line, "#") -> parse_header(line)
      String.starts_with?(line, "*") -> parse_list_md_level(line)
      true -> parse_paragraph(line)
    end
  end

  defp parse_header(line) do
    [header_markers | header_text] = String.split(line)
    header_tag = "h#{String.length(header_markers)}"
    header_text = Enum.join(header_text, " ")
    enclose_in_tag(header_text, header_tag)
  end

  defp enclose_in_tag(content, tag) do
    "<#{tag}>#{content}</#{tag}>"
  end

  defp parse_paragraph(line) do
    line
    |> join_words_with_tags()
    |> enclose_in_tag("p")
  end

  defp parse_list_md_level(list_line) do
    list_line
    |> String.trim_leading("* ")
    |> join_words_with_tags()
    |> enclose_in_tag("li")
  end

  defp join_words_with_tags(line) do
    line
    |> String.split()
    |> Enum.map(&replace_md_with_tag/1)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(word) do
    word
    |> String.replace(~r/^#{"__"}{1}/, "<strong>", global: false)
    |> String.replace(~r/^_/, "<em>", global: false)
    |> String.replace(~r/#{"__"}{1}$/, "</strong>")
    |> String.replace(~r/_$/, "</em>")
  end
end
