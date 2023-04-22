defmodule Backend.Certificates.ProductCertificate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_certificates" do
    field :created_at, :date
    field :hash, :string
    field :manufacturer, :id

    timestamps()
  end

  @doc false
  def changeset(product_certificate, attrs) do
    product_certificate
    |> cast(attrs, [:hash, :created_at])
    |> validate_required([:hash, :created_at])
  end
end
