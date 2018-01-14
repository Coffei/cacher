defmodule Cacher.Caches.Cache do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cacher.Caches.Cache
  alias Cacher.Cachenotes.Cachenote

  schema "caches" do
    field :code, :string
    field :type, :string
    field :lat, :integer
    field :lon, :integer
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
    |> validate_inclusion(:type, Map.values(cache_types()))
  end

  def cache_types do
    %{
      "Traditional cache" => "traditional",
      "Multi-cache" => "multi",
      "Mystery cache" => "mystery",
      "Wherigo Cache" => "wherigo",
      "Virtual Cache" => "virtual",
      "EarthCache" => "earth",
      "Letterbox" => "letter",
      "Event" => "event",
      "Cache In Trash Out Event" => "cito",
      "MegaEvent" => "mega-event",
      "GigaEvent" => "giga",
      "Unknown" => "unknown"
    }
  end
end
