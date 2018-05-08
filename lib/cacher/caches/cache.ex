defmodule Cacher.Caches.Cache do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cacher.Caches.Cache
  alias Cacher.Cachenotes.Cachenote

  schema "caches" do
    field :code, :string
    field :type, :string
    field :lat, :float
    field :lon, :float
    field :name, :string
    has_many :cachenotes, Cachenote

    timestamps()
  end

  @doc false
  def changeset(%Cache{} = cache, attrs) do
    cache
    |> cast(attrs, [:code, :name, :type, :lat, :lon])
    |> validate_required([:code, :name, :type])
    |> validate_format(:code, ~r/^GC.*/)
    |> validate_length(:code, is: 6)
    |> validate_length(:name, min: 2)
    |> validate_inclusion(:type, Map.keys(cache_types()))
  end

  def cache_types do
    %{
      "traditional" => "Traditional cache",
      "multi" => "Multi-cache",
      "mystery" => "Mystery cache",
      "wherigo" => "Wherigo Cache",
      "virtual" => "Virtual Cache",
      "earth" => "EarthCache",
      "letter" => "Letterbox",
      "event" => "Event",
      "cito" => "Cache In Trash Out Event",
      "mega-event" => "MegaEvent",
      "giga" => "GigaEvent",
      "unknown" => "Unknown"
    }
  end

  def cache_type_options do
    cache_types()
    |> Enum.map(fn {k,v} -> {v,k} end)
    |> Enum.into(%{})
  end
end
