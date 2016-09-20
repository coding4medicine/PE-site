defmodule C4m.PageController do
  use C4m.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
