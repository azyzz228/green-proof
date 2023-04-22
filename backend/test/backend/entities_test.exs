defmodule Backend.EntitiesTest do
  use Backend.DataCase

  alias Backend.Entities

  describe "suppliers" do
    alias Backend.Entities.Supplier

    import Backend.EntitiesFixtures

    @invalid_attrs %{address: nil, location: nil, name: nil}

    test "list_suppliers/0 returns all suppliers" do
      supplier = supplier_fixture()
      assert Entities.list_suppliers() == [supplier]
    end

    test "get_supplier!/1 returns the supplier with given id" do
      supplier = supplier_fixture()
      assert Entities.get_supplier!(supplier.id) == supplier
    end

    test "create_supplier/1 with valid data creates a supplier" do
      valid_attrs = %{address: "some address", location: "some location", name: "some name"}

      assert {:ok, %Supplier{} = supplier} = Entities.create_supplier(valid_attrs)
      assert supplier.address == "some address"
      assert supplier.location == "some location"
      assert supplier.name == "some name"
    end

    test "create_supplier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_supplier(@invalid_attrs)
    end

    test "update_supplier/2 with valid data updates the supplier" do
      supplier = supplier_fixture()
      update_attrs = %{address: "some updated address", location: "some updated location", name: "some updated name"}

      assert {:ok, %Supplier{} = supplier} = Entities.update_supplier(supplier, update_attrs)
      assert supplier.address == "some updated address"
      assert supplier.location == "some updated location"
      assert supplier.name == "some updated name"
    end

    test "update_supplier/2 with invalid data returns error changeset" do
      supplier = supplier_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_supplier(supplier, @invalid_attrs)
      assert supplier == Entities.get_supplier!(supplier.id)
    end

    test "delete_supplier/1 deletes the supplier" do
      supplier = supplier_fixture()
      assert {:ok, %Supplier{}} = Entities.delete_supplier(supplier)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_supplier!(supplier.id) end
    end

    test "change_supplier/1 returns a supplier changeset" do
      supplier = supplier_fixture()
      assert %Ecto.Changeset{} = Entities.change_supplier(supplier)
    end
  end

  describe "manufacturers" do
    alias Backend.Entities.Manufacturer

    import Backend.EntitiesFixtures

    @invalid_attrs %{address: nil, location: nil, name: nil}

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturer = manufacturer_fixture()
      assert Entities.list_manufacturers() == [manufacturer]
    end

    test "get_manufacturer!/1 returns the manufacturer with given id" do
      manufacturer = manufacturer_fixture()
      assert Entities.get_manufacturer!(manufacturer.id) == manufacturer
    end

    test "create_manufacturer/1 with valid data creates a manufacturer" do
      valid_attrs = %{address: "some address", location: "some location", name: "some name"}

      assert {:ok, %Manufacturer{} = manufacturer} = Entities.create_manufacturer(valid_attrs)
      assert manufacturer.address == "some address"
      assert manufacturer.location == "some location"
      assert manufacturer.name == "some name"
    end

    test "create_manufacturer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_manufacturer(@invalid_attrs)
    end

    test "update_manufacturer/2 with valid data updates the manufacturer" do
      manufacturer = manufacturer_fixture()
      update_attrs = %{address: "some updated address", location: "some updated location", name: "some updated name"}

      assert {:ok, %Manufacturer{} = manufacturer} = Entities.update_manufacturer(manufacturer, update_attrs)
      assert manufacturer.address == "some updated address"
      assert manufacturer.location == "some updated location"
      assert manufacturer.name == "some updated name"
    end

    test "update_manufacturer/2 with invalid data returns error changeset" do
      manufacturer = manufacturer_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_manufacturer(manufacturer, @invalid_attrs)
      assert manufacturer == Entities.get_manufacturer!(manufacturer.id)
    end

    test "delete_manufacturer/1 deletes the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{}} = Entities.delete_manufacturer(manufacturer)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_manufacturer!(manufacturer.id) end
    end

    test "change_manufacturer/1 returns a manufacturer changeset" do
      manufacturer = manufacturer_fixture()
      assert %Ecto.Changeset{} = Entities.change_manufacturer(manufacturer)
    end
  end
end
