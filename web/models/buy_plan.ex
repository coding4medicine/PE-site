defmodule C4m.BuyPlan do
  use C4m.Web, :model

  schema "buyplans" do
    field :user_id, :integer
    field :plan_id, :integer
    field :stripe_id, :string
    field :card_four, :integer
    field :price, :float
    field :status, :integer
    field :request_date, Ecto.DateTime
    field :purchase_date, Ecto.DateTime
    field :end_date, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :plan_id, :stripe_id, :card_four, :price, :status, :request_date, :purchase_date, :end_date])
    |> validate_required([:user_id, :plan_id, :stripe_id, :card_four, :price, :status, :request_date, :purchase_date, :end_date])
  end
end
