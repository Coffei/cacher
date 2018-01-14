defmodule Cacher.Cachenotes do

  import Ecto.Query, warn: false
  alias Cacher.Repo
  alias Cacher.Cachenotes.Cachenote

  def preload(user) do
    Repo.preload(user, :cachenotes)
  end

  def list_all(user) do
    query = from c in :cachenotes,
      where: c.user == ^user,
      select: c

    Repo.all(query)
  end
end
