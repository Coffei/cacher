defmodule Cacher.Repo.Migrations.CreateCachenote do
  use Ecto.Migration

  def change do
    create table(:cachenotes) do
      add :name, :string
      add :content, :string
      add :cache_id, references(:caches)
      add :user_id, references(:users)
    end
  end
end
