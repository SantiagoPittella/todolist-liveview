defmodule TodoListWeb.ItemsLive do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_view

  use Phoenix.LiveView
  use TodoListWeb.ItemController
  alias TodoListWeb.ItemView

  def render(assigns) do
    ItemView.render("items_live.html", assigns)
  end

  def mount(_params, _, socket) do
    items = TodoList.Todo.list_items()
    {:ok, assign(socket, :items, items)}
  end
end
