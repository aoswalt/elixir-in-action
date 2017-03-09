defmodule Lines do
  def lines_lengths(path) do
    File.stream!(path)
    |> Enum.map(&String.length/1)
    |> IO.inspect
  end
end

Lines.lines_lengths("./lines_lengths.exs")
