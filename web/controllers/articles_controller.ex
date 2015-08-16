defmodule Leditre.ArticlesController do
  use Leditre.Web, :controller

  alias Leditre.Articles

  plug :scrub_params, "articles" when action in [:create, :update]

  def index(conn, _params) do
    article = Repo.all(Articles)
    render(conn, "index.html", article: article)
  end

  def new(conn, _params) do
    changeset = Articles.changeset(%Articles{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"articles" => articles_params}) do
    changeset = Articles.changeset(%Articles{}, articles_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Articles created successfully.")
      |> redirect(to: articles_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    articles = Repo.get!(Articles, id)
    render(conn, "show.html", articles: articles)
  end

  def edit(conn, %{"id" => id}) do
    articles = Repo.get!(Articles, id)
    changeset = Articles.changeset(articles)
    render(conn, "edit.html", articles: articles, changeset: changeset)
  end

  def update(conn, %{"id" => id, "articles" => articles_params}) do
    articles = Repo.get!(Articles, id)
    changeset = Articles.changeset(articles, articles_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Articles updated successfully.")
      |> redirect(to: articles_path(conn, :index))
    else
      render(conn, "edit.html", articles: articles, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    articles = Repo.get!(Articles, id)
    Repo.delete!(articles)

    conn
    |> put_flash(:info, "Articles deleted successfully.")
    |> redirect(to: articles_path(conn, :index))
  end
	def search(conn, :keyword) do
		
	end
end
