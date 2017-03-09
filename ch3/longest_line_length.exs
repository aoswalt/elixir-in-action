defmodule Lines do
  def longest_line_length(path) do
    File.stream!(path)
    |> Enum.reduce(0, &(max(String.length(&1), &2)))
    |> IO.puts
  end
end

Lines.longest_line_length("./longest_line_length.exs")
