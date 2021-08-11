defmodule TodoListWeb.ItemsLive do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_view

  use Phoenix.LiveView
  use TodoListWeb.ItemController


  def render(assigns) do
    ~L"""
    <h1>Listing Items</h1>

<table>
  <thead>
    <tr>
      <th>Text</th>
      <th>Person</th>
      <th>Status</th>

      <th></th>
    </tr>
  </thead>
  <tbody>
<%= for item <- @items do %>
    <tr>
      <td><%= item.text %></td>
      <td><%= item.person_id %></td>
      <td><%= item.status %></td>

    </tr>
<% end %>

    """
  end

  def mount(_params, _, socket) do
    items = TodoList.Todo.list_items()
    {:ok, assign(socket, :items, items)}
  end
end
