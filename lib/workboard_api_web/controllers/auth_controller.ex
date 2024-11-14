defmodule WorkboardApiWeb.AuthController do
  use WorkboardApiWeb, :controller

  @users %{
    "user1@example.com" => "password1",
    "user2@example.com" => "password2",
    "user3@example.com" => "password3"
  }

  def login(conn, %{"email" => email, "password" => password}) do
    case Map.get(@users, email) do
      ^password ->
        token = Phoenix.Token.sign(WorkboardApiWeb.Endpoint, "user auth", email)
        json(conn, %{token: token})

      _ ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Authentication failed"})
    end
  end

  def login(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> json(%{error: "Invalid request"})
  end
end
