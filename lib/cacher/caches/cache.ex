defmodule Cacher.Caches.Cache do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cacher.Caches.Cache


  schema "caches" do
    field :code, :string
    field :description, :string
    field :lat, :integer
    field :lon, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Cache{} = cache, attrs) do
    cache
    |> cast(attrs, [:code, :name, :description, :lat, :lon])
    |> validate_required([:code, :name])
    |> validate_format(:code, ~r/^GC.*/)
    |> validate_length(:code, is: 6)
    |> validate_length(:name, min: 2)
  end
end
