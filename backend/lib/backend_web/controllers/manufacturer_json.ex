defmodule BackendWeb.ManufacturerJSON do
  alias Backend.Entities.Manufacturer

  @doc """
  Renders a list of manufacturers.
  """
  def index(%{manufacturers: manufacturers}) do
    %{data: for(manufacturer <- manufacturers, do: data(manufacturer))}
  end

  @doc """
  Renders a single manufacturer.
  """
  def show(%{manufacturer: manufacturer}) do
    %{data: data(manufacturer)}
  end

  defp data(%Manufacturer{} = manufacturer) do
    %{
      id: manufacturer.id,
      name: manufacturer.name,
      location: manufacturer.location,
      address: manufacturer.address
    }
  end
end
