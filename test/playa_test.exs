defmodule PlayaTest do
  use ExUnit.Case
  doctest Playa

  test "greets the world" do
    assert Playa.hello() == :world
  end
end
