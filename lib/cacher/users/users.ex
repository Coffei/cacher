defmodule Cacher.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Cacher.Repo

  alias Cacher.Users.User

  @doc """
  Returns the list of users.
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.
  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_by_username(username) do
    query = from u in User,
              where: u.username == ^username,
              select: u

    Repo.one(query)
  end

  @doc """
  Creates a user.
  """
  def create_user(attrs \\ %{}) do
    changes = Map.put(attrs, "crypted_password", hash_password(attrs["password"]))
    %User{}
    |> User.changeset(changes)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  defp hash_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
