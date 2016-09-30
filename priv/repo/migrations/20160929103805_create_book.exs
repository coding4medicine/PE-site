defmodule C4m.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :image, :string
      add :price, :float
      add :visible, :boolean, default: false, null: false

      timestamps()
    end

  end
end
