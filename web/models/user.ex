defmodule C4m.User do
  use C4m.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :reset_password_token, :string
    field :reset_password_sent_at, Ecto.DateTime
    field :confirmation_token, :string
    field :confirmation_sent_at, Ecto.DateTime
    field :confirmed_at, Ecto.DateTime

    timestamps()
  end


   def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email), [])
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
