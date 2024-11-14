defmodule WorkboardApiWeb.Plugs.ValidateToken do
  import Plug.Conn
  alias Phoenix.Token
  alias WorkboardApiWeb.Endpoint

  def init(options), do: options

  def call(conn, _opts) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] ->
        validate_token(conn, token)

      _ ->
        unauthorized(conn)
    end
  end

  defp validate_token(conn, token) do
    case Token.verify(Endpoint, "user auth", token, max_age: 86400) do
      {:ok, _email} ->
        conn

      {:error, _reason} ->
        unauthorized(conn)
    end
  end

  defp unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.json(%{error: "Authentication failed"})
    |> halt()
  end
end
