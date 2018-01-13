defmodule Cacher.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :name, :string
      add :crypted_password, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
