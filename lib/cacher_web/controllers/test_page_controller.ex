defmodule CacherWeb.TestPageController do
  use CacherWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
