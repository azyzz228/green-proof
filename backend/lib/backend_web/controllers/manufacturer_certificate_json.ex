defmodule BackendWeb.ManufacturerCertificateJSON do
  alias Backend.Certificates.ManufacturerCertificate

  @doc """
  Renders a list of manufacturer_certificates.
  """
  def index(%{manufacturer_certificates: manufacturer_certificates}) do
    %{data: for(manufacturer_certificate <- manufacturer_certificates, do: data(manufacturer_certificate))}
  end

  @doc """
  Renders a single manufacturer_certificate.
  """
  def show(%{manufacturer_certificate: manufacturer_certificate}) do
    %{data: data(manufacturer_certificate)}
  end

  defp data(%ManufacturerCertificate{} = manufacturer_certificate) do
    %{
      id: manufacturer_certificate.id,
      supplier: manufacturer_certificate.supplier,
      manufacturer: manufacturer_certificate.manufacturer,
      isLocallyOwned: manufacturer_certificate.isLocallyOwned,
      isRegenerative: manufacturer_certificate.isRegenerative,
      isFairTrade: manufacturer_certificate.isFairTrade,
      quantity: manufacturer_certificate.quantity,
      productName: manufacturer_certificate.productName,
      the_id: manufacturer_certificate.the_id
    }
  end
end
