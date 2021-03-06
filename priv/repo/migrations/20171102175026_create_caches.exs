defmodule Cacher.Repo.Migrations.CreateCaches do
  use Ecto.Migration

  def change do
    create table(:caches) do
      add :code, :string
      add :name, :string
      add :type, :string
      add :lat, :float
      add :lon, :float

      timestamps()
    end

    create unique_index(:caches, [:code])
  end
end
