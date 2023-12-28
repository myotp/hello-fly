defmodule HelloFlyWeb.PageLive do
  use Phoenix.LiveView
  alias HelloFly.MyMyth

  def mount(_, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  def handle_event("button-clicked", _, socket) do
    {:noreply, update(socket, :counter, &MyMyth.plus(&1, 1))}
  end

  def render(assigns) do
    ~H"""
    <h1>Hello Fly!</h1>
    <div class="text-left font-semibold text-3xl">Button clicked <%= @counter %> times!</div>
    <button
      class="py-2 px-4 mt-6 text-center border border-transparent font-semibold text-base rounded-md text-white bg-green-500 transition duration-150 ease-in-out outline-none hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
      phx-click="button-clicked"
    >
      Click Me!
    </button>
    """
  end
end
