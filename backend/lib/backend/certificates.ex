defmodule Backend.Certificates do
  @moduledoc """
  The Certificates context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Certificates.SupplierCertificate

  @doc """
  Returns the list of supplier_certificates.

  ## Examples

      iex> list_supplier_certificates()
      [%SupplierCertificate{}, ...]

  """
  def list_supplier_certificates do
    Repo.all(SupplierCertificate)
  end

  @doc """
  Gets a single supplier_certificate.

  Raises `Ecto.NoResultsError` if the Supplier certificate does not exist.

  ## Examples

      iex> get_supplier_certificate!(123)
      %SupplierCertificate{}

      iex> get_supplier_certificate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_supplier_certificate!(id), do: Repo.get!(SupplierCertificate, id)

  @doc """
  Creates a supplier_certificate.

  ## Examples

      iex> create_supplier_certificate(%{field: value})
      {:ok, %SupplierCertificate{}}

      iex> create_supplier_certificate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_supplier_certificate(attrs \\ %{}) do
    %SupplierCertificate{}
    |> SupplierCertificate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a supplier_certificate.

  ## Examples

      iex> update_supplier_certificate(supplier_certificate, %{field: new_value})
      {:ok, %SupplierCertificate{}}

      iex> update_supplier_certificate(supplier_certificate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_supplier_certificate(%SupplierCertificate{} = supplier_certificate, attrs) do
    supplier_certificate
    |> SupplierCertificate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a supplier_certificate.

  ## Examples

      iex> delete_supplier_certificate(supplier_certificate)
      {:ok, %SupplierCertificate{}}

      iex> delete_supplier_certificate(supplier_certificate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_supplier_certificate(%SupplierCertificate{} = supplier_certificate) do
    Repo.delete(supplier_certificate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking supplier_certificate changes.

  ## Examples

      iex> change_supplier_certificate(supplier_certificate)
      %Ecto.Changeset{data: %SupplierCertificate{}}

  """
  def change_supplier_certificate(%SupplierCertificate{} = supplier_certificate, attrs \\ %{}) do
    SupplierCertificate.changeset(supplier_certificate, attrs)
  end

  alias Backend.Certificates.ManufacturerCertificate

  @doc """
  Returns the list of manufacturer_certificates.

  ## Examples

      iex> list_manufacturer_certificates()
      [%ManufacturerCertificate{}, ...]

  """
  def list_manufacturer_certificates do
    Repo.all(ManufacturerCertificate)
  end

  @doc """
  Gets a single manufacturer_certificate.

  Raises `Ecto.NoResultsError` if the Manufacturer certificate does not exist.

  ## Examples

      iex> get_manufacturer_certificate!(123)
      %ManufacturerCertificate{}

      iex> get_manufacturer_certificate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manufacturer_certificate!(id), do: Repo.get!(ManufacturerCertificate, id)

  @doc """
  Creates a manufacturer_certificate.

  ## Examples

      iex> create_manufacturer_certificate(%{field: value})
      {:ok, %ManufacturerCertificate{}}

      iex> create_manufacturer_certificate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manufacturer_certificate(attrs \\ %{}) do
    %ManufacturerCertificate{}
    |> ManufacturerCertificate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manufacturer_certificate.

  ## Examples

      iex> update_manufacturer_certificate(manufacturer_certificate, %{field: new_value})
      {:ok, %ManufacturerCertificate{}}

      iex> update_manufacturer_certificate(manufacturer_certificate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manufacturer_certificate(%ManufacturerCertificate{} = manufacturer_certificate, attrs) do
    manufacturer_certificate
    |> ManufacturerCertificate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a manufacturer_certificate.

  ## Examples

      iex> delete_manufacturer_certificate(manufacturer_certificate)
      {:ok, %ManufacturerCertificate{}}

      iex> delete_manufacturer_certificate(manufacturer_certificate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manufacturer_certificate(%ManufacturerCertificate{} = manufacturer_certificate) do
    Repo.delete(manufacturer_certificate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manufacturer_certificate changes.

  ## Examples

      iex> change_manufacturer_certificate(manufacturer_certificate)
      %Ecto.Changeset{data: %ManufacturerCertificate{}}

  """
  def change_manufacturer_certificate(%ManufacturerCertificate{} = manufacturer_certificate, attrs \\ %{}) do
    ManufacturerCertificate.changeset(manufacturer_certificate, attrs)
  end

  alias Backend.Certificates.ProductCertificate

  @doc """
  Returns the list of product_certificates.

  ## Examples

      iex> list_product_certificates()
      [%ProductCertificate{}, ...]

  """
  def list_product_certificates do
    Repo.all(ProductCertificate)
  end

  @doc """
  Gets a single product_certificate.

  Raises `Ecto.NoResultsError` if the Product certificate does not exist.

  ## Examples

      iex> get_product_certificate!(123)
      %ProductCertificate{}

      iex> get_product_certificate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_certificate!(id), do: Repo.get!(ProductCertificate, id)

  def get_product_certificate_by_hash!(hash) do
    Repo.get!(ProductCertificate, hash)
  end
  @doc """
  Creates a product_certificate.

  ## Examples

      iex> create_product_certificate(%{field: value})
      {:ok, %ProductCertificate{}}

      iex> create_product_certificate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_certificate(attrs \\ %{}) do
    %ProductCertificate{}
    |> ProductCertificate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_certificate.

  ## Examples

      iex> update_product_certificate(product_certificate, %{field: new_value})
      {:ok, %ProductCertificate{}}

      iex> update_product_certificate(product_certificate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_certificate(%ProductCertificate{} = product_certificate, attrs) do
    product_certificate
    |> ProductCertificate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_certificate.

  ## Examples

      iex> delete_product_certificate(product_certificate)
      {:ok, %ProductCertificate{}}

      iex> delete_product_certificate(product_certificate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_certificate(%ProductCertificate{} = product_certificate) do
    Repo.delete(product_certificate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_certificate changes.

  ## Examples

      iex> change_product_certificate(product_certificate)
      %Ecto.Changeset{data: %ProductCertificate{}}

  """
  def change_product_certificate(%ProductCertificate{} = product_certificate, attrs \\ %{}) do
    ProductCertificate.changeset(product_certificate, attrs)
  end
end
