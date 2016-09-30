defmodule C4m.Admin do
  use C4m.Web, :model

  schema "admins" do
    field :email, :string
    field :password_hash, :string
    field :reset_password_token, :string
    field :reset_password_sent_at, Ecto.DateTime
    field :confirmation_token, :string
    field :confirmation_sent_at, Ecto.DateTime
    field :confirmed_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password_hash, :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmation_sent_at, :confirmed_at])
    |> validate_required([:email, :password_hash, :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmation_sent_at, :confirmed_at])
  end
end
