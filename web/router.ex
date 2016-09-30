defmodule C4m.Router do
  use C4m.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

   pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: C4m.Token
    plug Guardian.Plug.LoadResource
  end


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", C4m do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end


  scope "/", C4m do
    pipe_through [:browser, :browser_auth]
    resources "/users", UserController, only: [:show, :index, :update, :delete]

    resources "/books", BookController
    resources "/plans", PlanController
    resources "/sshkeys", SshkeyController
    resources "/buybooks", BuyBookController
    resources "/buyplans", BuyPlanController
    resources "/admins", AdminController
  end

  # Other scopes may use custom stacks.
  # scope "/api", C4m do
  #   pipe_through :api
  # end
end
