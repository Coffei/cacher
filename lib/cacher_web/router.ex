defmodule CacherWeb.Router do
  use CacherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CacherWeb do
    pipe_through :browser # Use the default browser stack

    get "/", LandingController, :index

    get "/caches/search", CacheController, :search
    resources "/caches", CacheController, only: [:index, :show, :new, :create]

    # user registration and login
    get "/registration", UserController, :registration, as: :registration
    post "/registration", UserController, :create, as: :registration
    get "/login", SessionController, :index
    post "/login", SessionController, :login
    delete "/logout", SessionController, :logout

  end

  # Other scopes may use custom stacks.
  # scope "/api", CacherWeb do
  #   pipe_through :api
  # end
end
