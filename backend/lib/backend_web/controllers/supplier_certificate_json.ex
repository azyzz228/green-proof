defmodule BackendWeb.SupplierCertificateJSON do
  alias Backend.Certificates.SupplierCertificate

  @doc """
  Renders a list of supplier_certificates.
  """
  def index(%{supplier_certificates: supplier_certificates}) do
    %{data: for(supplier_certificate <- supplier_certificates, do: data(supplier_certificate))}
  end

  @doc """
  Renders a single supplier_certificate.
  """
  def show(%{supplier_certificate: supplier_certificate}) do
    %{data: data(supplier_certificate)}
  end

  defp data(%SupplierCertificate{} = supplier_certificate) do
    %{
      id: supplier_certificate.id,
      supplier: supplier_certificate.supplier,
      manufacturer: supplier_certificate.manufacturer,
      isLocallyOwned: supplier_certificate.isLocallyOwned,
      isRegenerative: supplier_certificate.isRegenerative,
      isFairTrade: supplier_certificate.isFairTrade,
      quantity: supplier_certificate.quantity,
      productName: supplier_certificate.productName,
      the_id: supplier_certificate.the_id
    }
  end
end
