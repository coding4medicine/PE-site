defmodule C4m.BuyBook do
  use C4m.Web, :model

  schema "buybooks" do
    field :user_id, :integer
    field :book_id, :integer
    field :stripe_id, :string
    field :card_four, :integer
    field :price, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :book_id, :stripe_id, :card_four, :price])
    |> validate_required([:user_id, :book_id, :stripe_id, :card_four, :price])
  end
end
