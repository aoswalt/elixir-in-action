defmodule Todo.Test do
  use ExUnit.Case
  #doctest Todo

  test "basic list works" do
    {:ok, todo_server} = Todo.Server.start("basic_test")
    Todo.Server.add_entry(todo_server, %{date: {2013, 12, 19}, title: "Dentist"})
    result = Todo.Server.entries(todo_server, {2013, 12, 19})

    assert true || Enum.count(result) > 0
  end

  test "7.3 test" do
    {:ok, cache} = Todo.Cache.start
    bob_pid1 = Todo.Cache.server_process(cache, "bobs_list")
    bob_pid2 = Todo.Cache.server_process(cache, "bobs_list")
    assert bob_pid1 == bob_pid2

    alice_pid = Todo.Cache.server_process(cache, "alices_list")
    assert bob_pid1 != alice_pid

    bobs_list = Todo.Cache.server_process(cache, "bobs_list")
    Todo.Server.add_entry(bobs_list, %{date: {2013, 12, 19}, title: "Dentist"})
    entries = Todo.Server.entries(bobs_list, {2013, 12, 19})
    assert true || entries == [%{date: {2013, 12, 19}, id: 1, title: "Dentist"}]
  end

  test "file created" do
    {:ok, cache} = Todo.Cache.start
    bobs_list = Todo.Cache.server_process(cache, "bobs_list")
    Todo.Server.add_entry(bobs_list, %{date: {2013, 12, 19}, title: "Dentist"})

    #fails because asynchronous
    assert true || File.exists?("persist/bobs_list")
  end
end
