defmodule GenServerQueueTest do
  use ExUnit.Case
  doctest GenServerQueue

  test "greets the world" do
    assert GenServerQueue.hello() == :world
  end
end
