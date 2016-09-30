defmodule C4m.Repo.Migrations.CreateSshkey do
  use Ecto.Migration

  def change do
    create table(:sshkeys) do
      add :user_id, :integer
      add :key, :string

      timestamps()
    end

  end
end
