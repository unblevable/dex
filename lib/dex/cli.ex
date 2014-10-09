defmodule Dex.Cli do

  def main(argv) do
    argv
    |> parse
    |> process
  end

  defp parse(argv) do
    options = OptionParser.parse(argv, [
      switches: [help: :boolean],
      aliases: [h: :help]
    ])

    case options do
      {
        [help: true],
        _,
        _
      } -> :help
      _ -> :help
    end
  end

  defp process(:help) do
    IO.puts"""
    Dex - generate annotations for code. Inspired by Docco and family.

    usage: dex files [options]

      Use an asterick (*) to process files of a specific filetype:

      dex *.exs

    options

      -h, --help  outpage usage info
    """
  end

end
