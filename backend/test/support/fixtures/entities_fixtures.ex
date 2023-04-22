defmodule Backend.EntitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Entities` context.
  """

  @doc """
  Generate a supplier.
  """
  def supplier_fixture(attrs \\ %{}) do
    {:ok, supplier} =
      attrs
      |> Enum.into(%{
        address: "some address",
        location: "some location",
        name: "some name"
      })
      |> Backend.Entities.create_supplier()

    supplier
  end

  @doc """
  Generate a manufacturer.
  """
  def manufacturer_fixture(attrs \\ %{}) do
    {:ok, manufacturer} =
      attrs
      |> Enum.into(%{
        address: "some address",
        location: "some location",
        name: "some name"
      })
      |> Backend.Entities.create_manufacturer()

    manufacturer
  end
end
