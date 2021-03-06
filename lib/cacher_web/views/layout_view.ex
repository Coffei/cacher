defmodule CacherWeb.LayoutView do
  use CacherWeb, :view
  alias Cacher.Repo
  alias Cacher.Users.User

  def title() do
    "Cacher..."
  end

  def logged_in?(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id do
      Repo.get(User, id) != nil
    else
      false
    end
  end

  def logged_in_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Repo.get(User, id)
  end
end
