defmodule CacherWeb.UserController do
  use CacherWeb, :controller

  alias Cacher.Users
  alias Cacher.Users.User

  def registration(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "registration.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Your account was created. You can log in now.")
        |> redirect(to: "/login")
      {:error, changeset} ->
        conn
        |> render("registration.html", changeset: changeset)
    end
  end

  ## old stuff
  # def index(conn, _params) do
  #   users = Users.list_users()
  #   render(conn, "index.html", users: users)
  # end

  # def new(conn, _params) do
  #   changeset = Users.change_user(%User{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{"user" => user_params}) do
  #   case Users.create_user(user_params) do
  #     {:ok, user} ->
  #       conn
  #       |> put_flash(:info, "User created successfully.")
  #       |> redirect(to: user_path(conn, :show, user))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   user = Users.get_user!(id)
  #   render(conn, "show.html", user: user)
  # end

  # def edit(conn, %{"id" => id}) do
  #   user = Users.get_user!(id)
  #   changeset = Users.change_user(user)
  #   render(conn, "edit.html", user: user, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "user" => user_params}) do
  #   user = Users.get_user!(id)

  #   case Users.update_user(user, user_params) do
  #     {:ok, user} ->
  #       conn
  #       |> put_flash(:info, "User updated successfully.")
  #       |> redirect(to: user_path(conn, :show, user))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", user: user, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   user = Users.get_user!(id)
  #   {:ok, _user} = Users.delete_user(user)

  #   conn
  #   |> put_flash(:info, "User deleted successfully.")
  #   |> redirect(to: user_path(conn, :index))
  # end
end
