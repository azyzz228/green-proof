defmodule Backend.CertificatesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Certificates` context.
  """

  @doc """
  Generate a supplier_certificate.
  """
  def supplier_certificate_fixture(attrs \\ %{}) do
    {:ok, supplier_certificate} =
      attrs
      |> Enum.into(%{
        isFairTrade: true,
        isLocallyOwned: true,
        isRegenerative: true,
        manufacturer: "some manufacturer",
        productName: "some productName",
        quantity: 42,
        supplier: "some supplier",
        the_id: 42
      })
      |> Backend.Certificates.create_supplier_certificate()

    supplier_certificate
  end

  @doc """
  Generate a manufacturer_certificate.
  """
  def manufacturer_certificate_fixture(attrs \\ %{}) do
    {:ok, manufacturer_certificate} =
      attrs
      |> Enum.into(%{
        isFairTrade: true,
        isLocallyOwned: true,
        isRegenerative: true,
        manufacturer: "some manufacturer",
        productName: "some productName",
        quantity: 42,
        supplier: "some supplier",
        the_id: 42
      })
      |> Backend.Certificates.create_manufacturer_certificate()

    manufacturer_certificate
  end

  @doc """
  Generate a product_certificate.
  """
  def product_certificate_fixture(attrs \\ %{}) do
    {:ok, product_certificate} =
      attrs
      |> Enum.into(%{
        created_at: ~D[2023-04-21],
        hash: "some hash"
      })
      |> Backend.Certificates.create_product_certificate()

    product_certificate
  end
end
