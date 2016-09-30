defmodule C4m.Repo.Migrations.CreateBuyBook do
  use Ecto.Migration

  def change do
    create table(:buybooks) do
      add :user_id, :integer
      add :book_id, :integer
      add :stripe_id, :string
      add :card_four, :integer
      add :price, :float

      timestamps()
    end

  end
end
