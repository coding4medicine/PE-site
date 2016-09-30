defmodule C4m.Repo.Migrations.CreatePlan do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :name, :string
      add :stripe_id, :string
      add :price, :float
      add :interval, :datetime
      add :visible, :boolean, default: false, null: false

      timestamps()
    end

  end
end
