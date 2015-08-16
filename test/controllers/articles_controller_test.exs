defmodule Leditre.ArticlesControllerTest do
  use Leditre.ConnCase

  alias Leditre.Articles
  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, articles_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing article"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, articles_path(conn, :new)
    assert html_response(conn, 200) =~ "New articles"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, articles_path(conn, :create), articles: @valid_attrs
    assert redirected_to(conn) == articles_path(conn, :index)
    assert Repo.get_by(Articles, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, articles_path(conn, :create), articles: @invalid_attrs
    assert html_response(conn, 200) =~ "New articles"
  end

  test "shows chosen resource", %{conn: conn} do
    articles = Repo.insert! %Articles{}
    conn = get conn, articles_path(conn, :show, articles)
    assert html_response(conn, 200) =~ "Show articles"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, articles_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    articles = Repo.insert! %Articles{}
    conn = get conn, articles_path(conn, :edit, articles)
    assert html_response(conn, 200) =~ "Edit articles"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    articles = Repo.insert! %Articles{}
    conn = put conn, articles_path(conn, :update, articles), articles: @valid_attrs
    assert redirected_to(conn) == articles_path(conn, :index)
    assert Repo.get_by(Articles, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    articles = Repo.insert! %Articles{}
    conn = put conn, articles_path(conn, :update, articles), articles: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit articles"
  end

  test "deletes chosen resource", %{conn: conn} do
    articles = Repo.insert! %Articles{}
    conn = delete conn, articles_path(conn, :delete, articles)
    assert redirected_to(conn) == articles_path(conn, :index)
    refute Repo.get(Articles, articles.id)
  end
end
