defmodule WorkboardApiWeb.HomeController do
  use WorkboardApiWeb, :controller

  def show(conn, _) do
    json(conn, %{message: "Workboard API is functioning"})
  end
end
