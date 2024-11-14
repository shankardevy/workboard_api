defmodule WorkboardApiWeb.Router do
  use WorkboardApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated_api do
    plug WorkboardApiWeb.Plugs.ValidateToken
  end

  scope "/", WorkboardApiWeb do
    pipe_through :api

    get "/", HomeController, :show
    post "/login", AuthController, :login

    scope "/" do
      pipe_through :authenticated_api

      get "/projects", ProjectController, :index
      get "/projects/:id", ProjectController, :show
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:workboard_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: WorkboardApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
