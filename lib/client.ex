defmodule GenServerQueue.Client do
  alias GenServerQueue.Server

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(Server, initial_stack)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  def read(pid) do
    GenServer.call(pid, :read)
  end
end
