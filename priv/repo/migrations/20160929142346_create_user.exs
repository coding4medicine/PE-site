defmodule C4m.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :reset_password_token, :string
      add :reset_password_sent_at, :datetime
      add :confirmation_token, :string
      add :confirmation_sent_at, :datetime
      add :confirmed_at, :datetime

      timestamps()
    end

  end
end
