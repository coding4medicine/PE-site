defmodule C4m.Sshkey do
  use C4m.Web, :model

  schema "sshkeys" do
    field :user_id, :integer
    field :key, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :key])
    |> validate_required([:user_id, :key])
  end
end
