defmodule Todo.Test do
  use ExUnit.Case
  #doctest Todo

  test "basic list works" do
    {:ok, todo_server} = Todo.Server.start

    Todo.Server.add_entry(todo_server, %{date: {2013, 12, 19}, title: "Dentist"})

    result = Todo.Server.entries(todo_server, {2013, 12, 19})

    assert Enum.count(result) > 0
  end
end
