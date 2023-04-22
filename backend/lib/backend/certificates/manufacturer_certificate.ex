defmodule Backend.Certificates.ManufacturerCertificate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manufacturer_certificates" do
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
  def changeset(manufacturer_certificate, attrs) do
    manufacturer_certificate
    |> cast(attrs, [:supplier, :manufacturer, :isLocallyOwned, :isRegenerative, :isFairTrade, :quantity, :productName, :the_id])
    |> validate_required([:supplier, :manufacturer, :isLocallyOwned, :isRegenerative, :isFairTrade, :quantity, :productName, :the_id])
  end
end
