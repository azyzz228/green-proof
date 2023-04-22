defmodule Backend.Entities.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manufacturers" do
    field :address, :string
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name, :location, :address])
    |> validate_required([:name, :location, :address])
  end
end
