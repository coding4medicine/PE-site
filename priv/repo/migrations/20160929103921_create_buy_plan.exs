defmodule C4m.Repo.Migrations.CreateBuyPlan do
  use Ecto.Migration

  def change do
    create table(:buyplans) do
      add :user_id, :integer
      add :plan_id, :integer
      add :stripe_id, :string
      add :card_four, :integer
      add :price, :float
      add :status, :integer
      add :request_date, :datetime
      add :purchase_date, :datetime
      add :end_date, :datetime

      timestamps()
    end

  end
end
