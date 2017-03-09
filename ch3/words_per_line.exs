defmodule Lines do
  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.split/1)
    |> Enum.map(&Enum.count/1)
    |> IO.inspect
  end
end

Lines.words_per_line!('./words_per_line.exs')
