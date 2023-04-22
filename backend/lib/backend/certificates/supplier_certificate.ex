defmodule Backend.Certificates.SupplierCertificate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "supplier_certificates" do
    field :isFairTrade, :boolean, default: false
    field :isLocallyOwned, :boolean, default: false
    field :isRegenerative, :boolean, default: false
    field :manufacturer, :string
    field :productName, :string
    field :quantity, :integer
    field :supplier, :string
    field :the_id, :integer

    timestamps()
  end

  @doc false
  def changeset(supplier_certificate, attrs) do
    supplier_certificate
    |> cast(attrs, [:supplier, :manufacturer, :isLocallyOwned, :isRegenerative, :isFairTrade, :quantity, :productName, :the_id])
    |> validate_required([:supplier, :manufacturer, :isLocallyOwned, :isRegenerative, :isFairTrade, :quantity, :productName, :the_id])
  end
end
