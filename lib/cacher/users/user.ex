defmodule Cacher.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cacher.Users.User

  schema "users" do
    field :name, :string
    field :username, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :crypted_password])
    |> validate_required([:username, :name, :crypted_password])
    |> validate_length(:password, min: 5)
    |> unique_constraint(:username)
  end
end
