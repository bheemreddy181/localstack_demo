defmodule DemoAppWeb.ApiController do
  use DemoAppWeb, :controller

  def sns_webhook(conn, _params) do
    IO.inspect(conn)
    json conn, %{success: true}
  end
end
