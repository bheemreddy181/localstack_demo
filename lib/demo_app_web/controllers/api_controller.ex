defmodule DemoAppWeb.ApiController do
  use DemoAppWeb, :controller

  def sns_webhook(conn, _params) do
    IO.inspect("================")
    IO.inspect("RECEIVING SNS MESSAGE")
    IO.inspect("================")
    IO.inspect(conn)
    json conn, %{success: true}
  end
end
