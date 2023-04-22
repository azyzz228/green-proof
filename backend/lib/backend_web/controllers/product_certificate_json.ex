defmodule BackendWeb.ProductCertificateJSON do
  alias Backend.Certificates.ProductCertificate

  @doc """
  Renders a list of product_certificates.
  """
  def index(%{product_certificates: product_certificates}) do
    %{data: for(product_certificate <- product_certificates, do: data(product_certificate))}
  end

  @doc """
  Renders a single product_certificate.
  """
  def show(%{product_certificate: product_certificate}) do
    %{data: data(product_certificate)}
  end

  defp data(%ProductCertificate{} = product_certificate) do
    %{
      id: product_certificate.id,
      hash: product_certificate.hash,
      created_at: product_certificate.created_at
    }
  end
end
