defmodule Leditre.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:article) do
      add :title, :text
      add :body, :text

      timestamps
    end

  end
end
