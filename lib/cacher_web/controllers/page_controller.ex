defmodule CacherWeb.PageController do
  use CacherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
