defmodule Cacher.Cachenotes.Cachenote do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cacher.Cachenotes.Cachenote
  alias Cacher.Users.User
  alias Cacher.Caches.Cache

  schema "cachenotes" do
    field :name, :string
    field :content, :string
    belongs_to :user, User
    belongs_to :cache, Cache
  end
end
