defmodule BackendWeb.SupplierJSON do
  alias Backend.Entities.Supplier

  @doc """
  Renders a list of suppliers.
  """
  def index(%{suppliers: suppliers}) do
    %{data: for(supplier <- suppliers, do: data(supplier))}
  end

  @doc """
  Renders a single supplier.
  """
  def show(%{supplier: supplier}) do
    %{data: data(supplier)}
  end

  defp data(%Supplier{} = supplier) do
    %{
      id: supplier.id,
      name: supplier.name,
      location: supplier.location,
      address: supplier.address
    }
  end
end
