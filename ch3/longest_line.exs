defmodule Lines do
  def longest_line!(path) do
    File.stream!(path)
    |> Enum.reduce("", &longer/2)
    |> IO.puts
  end

  defp longer(string1, string2) do
    if String.length(string1) > String.length(string2), do: string1, else: string2
  end
end

Lines.longest_line!("./longest_line.exs")
