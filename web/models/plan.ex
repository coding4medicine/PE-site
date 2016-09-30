defmodule C4m.Plan do
  use C4m.Web, :model

  schema "plans" do
    field :name, :string
    field :stripe_id, :string
    field :price, :float
    field :interval, Ecto.DateTime
    field :visible, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :stripe_id, :price, :interval, :visible])
    |> validate_required([:name, :stripe_id, :price, :interval, :visible])
  end
end
