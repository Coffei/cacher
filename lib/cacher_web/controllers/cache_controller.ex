defmodule CacherWeb.CacheController do
  use CacherWeb, :controller

  alias Cacher.Caches
  alias Cacher.Caches.Cache

  def index(conn, _params) do
    current_user = get_session(conn, :current_user)
    render(conn, "index.html", caches: nil, current_user: current_user)
  end

  def search(conn, %{"search" => %{"query" => query}}) do
    current_user = get_session(conn, :current_user)
    case String.trim(query) do
      "" ->
        conn
        |> put_flash(:warning, "Cannot use empty query.")
        |> render("index.html", caches: nil, current_user: current_user)
      query ->
        caches = Caches.search(query)
        render(conn, "index.html", caches: caches, current_user: current_user)
    end
  end

  def show(conn, %{"id" => id}) do
    cache = Caches.get_by_code!(id)
    render(conn, "show.html", cache: cache)
  end

  def new(conn, _params) do
    if get_session(conn, :current_user) do
      changeset = Caches.change(%Cache{})
      render(conn, "new.html", changeset: changeset)
    else
      redirect(conn, to: cache_path(conn, :index))
    end
  end

  def create(conn, %{"cache" => params}) do
    case Caches.create(params) do
      {:ok, cache} ->
        conn
        |> put_flash(:info, "Cache #{cache.code}: #{cache.name} created.")
        |> redirect(to: "/") # replace to the cache details
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
