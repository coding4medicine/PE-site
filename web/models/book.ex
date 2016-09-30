defmodule C4m.Book do
  use C4m.Web, :model

  schema "books" do
    field :title, :string
    field :author, :string
    field :image, :string
    field :price, :float
    field :visible, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :image, :price, :visible])
    |> validate_required([:title, :author, :image, :price, :visible])
  end
end
