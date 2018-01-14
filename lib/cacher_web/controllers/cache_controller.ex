defmodule CacherWeb.CacheController do
  use CacherWeb, :controller

  alias Cacher.Caches
  alias Cacher.Caches.Cache

  def index(conn, _params) do
    render(conn, "index.html", caches: nil)
  end

  def search(conn, %{"search" => %{"query" => query}}) do
    case String.trim(query) do
      "" ->
        conn
        |> put_flash(:warning, "Cannot use empty query.")
        |> render("index.html", caches: nil)
      query ->
        caches = Caches.search(query)
        render(conn, "index.html", caches: caches)
    end
  end

  def show(conn, %{"id" => id}) do
    cache = Caches.get!(id)
    render(conn, "show.html", cache: cache)
  end

  def new(conn, _params) do
    changeset = Caches.change(%Cache{})
    render(conn, "new.html", changeset: changeset)
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
