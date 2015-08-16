defmodule Leditre.PageController do
  use Leditre.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
