defmodule Cacher.Caches do
  @moduledoc """
  The Caches context.
  """

  import Ecto.Query, warn: false
  alias Cacher.Repo

  alias Cacher.Caches.Cache

  def list_all() do
    Repo.all(Cache)
  end

  def get!(id) do
    Repo.get!(Cache, id)
  end

  def create(attrs \\ %{}) do
    %Cache{}
    |> Cache.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Cache{} = cache, attrs) do
    cache
    |> Cache.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Cache{} = cache) do
    Repo.delete(cache)
  end

  def change(%Cache{} = cache) do
    Cache.changeset(cache, %{})
  end
end
