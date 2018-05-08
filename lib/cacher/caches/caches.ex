defmodule Cacher.Caches do
  @moduledoc """
  The Caches context.
  """

  import Ecto.Query, warn: false
  alias Cacher.Repo

  alias Cacher.Caches.Cache

  def search(string) do
    like_string = "%#{string}%"
    query = from c in Cache,
              where: ilike(c.name, ^like_string) or ilike(c.code, ^like_string)

    Repo.all(query)
  end

  def get!(id) do
    Repo.get!(Cache, id)
  end

  def get_by_code!(code) do
    query = from c in Cache,
      where: c.code == ^code

    Repo.one!(query)
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
