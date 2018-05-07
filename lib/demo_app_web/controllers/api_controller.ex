defmodule DemoAppWeb.ApiController do
  use DemoAppWeb, :controller

  def sns_webhook(conn, params) do
    {:ok, message_data, _conn_details} = Plug.Conn.read_body(conn)
    IO.puts("================")
    IO.puts("RECEIVING SNS MESSAGE")
    IO.inspect(message_data)
    IO.puts("================")
    json conn, %{success: true}
  end
end
