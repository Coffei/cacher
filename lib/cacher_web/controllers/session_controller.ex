defmodule CacherWeb.SessionController do
  use CacherWeb, :controller
  alias Cacher.Users

  def index(conn, _params) do
    render(conn, "login.html")
  end

  def login(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case authenticate(username, password) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in.")
        |> redirect(to: "/")
      {:error, _} ->
        conn
        |> put_flash(:error, "Incorrect credentials. Please try again.params")
        |> render("login.html")
    end
  end

  def logout(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: "/")
  end

  defp authenticate(username, password) do
    case Users.get_by_username(username) do
      nil -> {:error, :not_found}
      user ->
        if Comeonin.Bcrypt.checkpw(password, user.crypted_password) do
          {:ok, user}
        else
          {:error, :bad_password}
        end
    end
  end
end
