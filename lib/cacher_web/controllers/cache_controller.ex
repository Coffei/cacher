defmodule CacherWeb.CacheController do
  use CacherWeb, :controller

  alias Cacher.Caches
  alias Cacher.Caches.Cache

  def index(conn, _params) do
    caches = Caches.list_all()
    render(conn, "index.html", caches: caches)
  end

  def show(conn, %{"id" => id}) do
    cache = Caches.get!(id)
    render(conn, "show.html", cache: cache)
  end

  def new(conn, _params) do
    changeset = Caches.change(%Cache{})
    render(conn, "new.html", changeset: changeset)
  end
end
