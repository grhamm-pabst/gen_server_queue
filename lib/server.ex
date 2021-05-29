defmodule GenServerQueue.Server do
  use GenServer

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # SYNC
  @impl true
  def handle_call({:enqueue, element}, _from, stack) do
    new_stack = stack ++ [element]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | new_stack]) do
    {:reply, head, new_stack}
  end

  @impl true
  def handle_call(:dequeue, _from, _stack) do
    {:reply, nil, []}
  end

  @impl true
  def handle_call(:read, _from, stack) do
    {:reply, stack, stack}
  end

  # ASYNC
  @impl true
  def handle_cast({:enqueue, element}, stack) do
    new_stack = stack ++ [element]
    {:noreply, new_stack}
  end

  @impl true
  def handle_cast(:dequeue, [_head | new_stack]) do
    {:noreply, new_stack}
  end
end
