defmodule Leditre.ArticlesTest do
  use Leditre.ModelCase

  alias Leditre.Articles

  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Articles.changeset(%Articles{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Articles.changeset(%Articles{}, @invalid_attrs)
    refute changeset.valid?
  end
end
