defmodule DemoAppWeb.PageController do
  use DemoAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def sns_webhook(conn, _params) do
    IO.inspect(conn)
    json conn, %{success: true}
  end
end
