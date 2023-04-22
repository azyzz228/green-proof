defmodule Backend.Entities.Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suppliers" do
    field :address, :string
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [:name, :location, :address])
    |> validate_required([:name, :location, :address])
  end
end
