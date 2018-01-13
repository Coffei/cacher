defmodule Cacher.Repo.Migrations.CreateCaches do
  use Ecto.Migration

  def change do
    create table(:caches) do
      add :code, :string
      add :name, :string
      add :description, :string
      add :lat, :integer
      add :lon, :integer

      timestamps()
    end

  end
end
