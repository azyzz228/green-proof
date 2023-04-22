defmodule Backend.CertificatesTest do
  use Backend.DataCase

  alias Backend.Certificates

  describe "supplier_certificates" do
    alias Backend.Certificates.SupplierCertificate

    import Backend.CertificatesFixtures

    @invalid_attrs %{isFairTrade: nil, isLocallyOwned: nil, isRegenerative: nil, manufacturer: nil, productName: nil, quantity: nil, supplier: nil, the_id: nil}

    test "list_supplier_certificates/0 returns all supplier_certificates" do
      supplier_certificate = supplier_certificate_fixture()
      assert Certificates.list_supplier_certificates() == [supplier_certificate]
    end

    test "get_supplier_certificate!/1 returns the supplier_certificate with given id" do
      supplier_certificate = supplier_certificate_fixture()
      assert Certificates.get_supplier_certificate!(supplier_certificate.id) == supplier_certificate
    end

    test "create_supplier_certificate/1 with valid data creates a supplier_certificate" do
      valid_attrs = %{isFairTrade: true, isLocallyOwned: true, isRegenerative: true, manufacturer: "some manufacturer", productName: "some productName", quantity: 42, supplier: "some supplier", the_id: 42}

      assert {:ok, %SupplierCertificate{} = supplier_certificate} = Certificates.create_supplier_certificate(valid_attrs)
      assert supplier_certificate.isFairTrade == true
      assert supplier_certificate.isLocallyOwned == true
      assert supplier_certificate.isRegenerative == true
      assert supplier_certificate.manufacturer == "some manufacturer"
      assert supplier_certificate.productName == "some productName"
      assert supplier_certificate.quantity == 42
      assert supplier_certificate.supplier == "some supplier"
      assert supplier_certificate.the_id == 42
    end

    test "create_supplier_certificate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Certificates.create_supplier_certificate(@invalid_attrs)
    end

    test "update_supplier_certificate/2 with valid data updates the supplier_certificate" do
      supplier_certificate = supplier_certificate_fixture()
      update_attrs = %{isFairTrade: false, isLocallyOwned: false, isRegenerative: false, manufacturer: "some updated manufacturer", productName: "some updated productName", quantity: 43, supplier: "some updated supplier", the_id: 43}

      assert {:ok, %SupplierCertificate{} = supplier_certificate} = Certificates.update_supplier_certificate(supplier_certificate, update_attrs)
      assert supplier_certificate.isFairTrade == false
      assert supplier_certificate.isLocallyOwned == false
      assert supplier_certificate.isRegenerative == false
      assert supplier_certificate.manufacturer == "some updated manufacturer"
      assert supplier_certificate.productName == "some updated productName"
      assert supplier_certificate.quantity == 43
      assert supplier_certificate.supplier == "some updated supplier"
      assert supplier_certificate.the_id == 43
    end

    test "update_supplier_certificate/2 with invalid data returns error changeset" do
      supplier_certificate = supplier_certificate_fixture()
      assert {:error, %Ecto.Changeset{}} = Certificates.update_supplier_certificate(supplier_certificate, @invalid_attrs)
      assert supplier_certificate == Certificates.get_supplier_certificate!(supplier_certificate.id)
    end

    test "delete_supplier_certificate/1 deletes the supplier_certificate" do
      supplier_certificate = supplier_certificate_fixture()
      assert {:ok, %SupplierCertificate{}} = Certificates.delete_supplier_certificate(supplier_certificate)
      assert_raise Ecto.NoResultsError, fn -> Certificates.get_supplier_certificate!(supplier_certificate.id) end
    end

    test "change_supplier_certificate/1 returns a supplier_certificate changeset" do
      supplier_certificate = supplier_certificate_fixture()
      assert %Ecto.Changeset{} = Certificates.change_supplier_certificate(supplier_certificate)
    end
  end

  describe "manufacturer_certificates" do
    alias Backend.Certificates.ManufacturerCertificate

    import Backend.CertificatesFixtures

    @invalid_attrs %{isFairTrade: nil, isLocallyOwned: nil, isRegenerative: nil, manufacturer: nil, productName: nil, quantity: nil, supplier: nil, the_id: nil}

    test "list_manufacturer_certificates/0 returns all manufacturer_certificates" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      assert Certificates.list_manufacturer_certificates() == [manufacturer_certificate]
    end

    test "get_manufacturer_certificate!/1 returns the manufacturer_certificate with given id" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      assert Certificates.get_manufacturer_certificate!(manufacturer_certificate.id) == manufacturer_certificate
    end

    test "create_manufacturer_certificate/1 with valid data creates a manufacturer_certificate" do
      valid_attrs = %{isFairTrade: true, isLocallyOwned: true, isRegenerative: true, manufacturer: "some manufacturer", productName: "some productName", quantity: 42, supplier: "some supplier", the_id: 42}

      assert {:ok, %ManufacturerCertificate{} = manufacturer_certificate} = Certificates.create_manufacturer_certificate(valid_attrs)
      assert manufacturer_certificate.isFairTrade == true
      assert manufacturer_certificate.isLocallyOwned == true
      assert manufacturer_certificate.isRegenerative == true
      assert manufacturer_certificate.manufacturer == "some manufacturer"
      assert manufacturer_certificate.productName == "some productName"
      assert manufacturer_certificate.quantity == 42
      assert manufacturer_certificate.supplier == "some supplier"
      assert manufacturer_certificate.the_id == 42
    end

    test "create_manufacturer_certificate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Certificates.create_manufacturer_certificate(@invalid_attrs)
    end

    test "update_manufacturer_certificate/2 with valid data updates the manufacturer_certificate" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      update_attrs = %{isFairTrade: false, isLocallyOwned: false, isRegenerative: false, manufacturer: "some updated manufacturer", productName: "some updated productName", quantity: 43, supplier: "some updated supplier", the_id: 43}

      assert {:ok, %ManufacturerCertificate{} = manufacturer_certificate} = Certificates.update_manufacturer_certificate(manufacturer_certificate, update_attrs)
      assert manufacturer_certificate.isFairTrade == false
      assert manufacturer_certificate.isLocallyOwned == false
      assert manufacturer_certificate.isRegenerative == false
      assert manufacturer_certificate.manufacturer == "some updated manufacturer"
      assert manufacturer_certificate.productName == "some updated productName"
      assert manufacturer_certificate.quantity == 43
      assert manufacturer_certificate.supplier == "some updated supplier"
      assert manufacturer_certificate.the_id == 43
    end

    test "update_manufacturer_certificate/2 with invalid data returns error changeset" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      assert {:error, %Ecto.Changeset{}} = Certificates.update_manufacturer_certificate(manufacturer_certificate, @invalid_attrs)
      assert manufacturer_certificate == Certificates.get_manufacturer_certificate!(manufacturer_certificate.id)
    end

    test "delete_manufacturer_certificate/1 deletes the manufacturer_certificate" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      assert {:ok, %ManufacturerCertificate{}} = Certificates.delete_manufacturer_certificate(manufacturer_certificate)
      assert_raise Ecto.NoResultsError, fn -> Certificates.get_manufacturer_certificate!(manufacturer_certificate.id) end
    end

    test "change_manufacturer_certificate/1 returns a manufacturer_certificate changeset" do
      manufacturer_certificate = manufacturer_certificate_fixture()
      assert %Ecto.Changeset{} = Certificates.change_manufacturer_certificate(manufacturer_certificate)
    end
  end

  describe "product_certificates" do
    alias Backend.Certificates.ProductCertificate

    import Backend.CertificatesFixtures

    @invalid_attrs %{created_at: nil, hash: nil}

    test "list_product_certificates/0 returns all product_certificates" do
      product_certificate = product_certificate_fixture()
      assert Certificates.list_product_certificates() == [product_certificate]
    end

    test "get_product_certificate!/1 returns the product_certificate with given id" do
      product_certificate = product_certificate_fixture()
      assert Certificates.get_product_certificate!(product_certificate.id) == product_certificate
    end

    test "create_product_certificate/1 with valid data creates a product_certificate" do
      valid_attrs = %{created_at: ~D[2023-04-21], hash: "some hash"}

      assert {:ok, %ProductCertificate{} = product_certificate} = Certificates.create_product_certificate(valid_attrs)
      assert product_certificate.created_at == ~D[2023-04-21]
      assert product_certificate.hash == "some hash"
    end

    test "create_product_certificate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Certificates.create_product_certificate(@invalid_attrs)
    end

    test "update_product_certificate/2 with valid data updates the product_certificate" do
      product_certificate = product_certificate_fixture()
      update_attrs = %{created_at: ~D[2023-04-22], hash: "some updated hash"}

      assert {:ok, %ProductCertificate{} = product_certificate} = Certificates.update_product_certificate(product_certificate, update_attrs)
      assert product_certificate.created_at == ~D[2023-04-22]
      assert product_certificate.hash == "some updated hash"
    end

    test "update_product_certificate/2 with invalid data returns error changeset" do
      product_certificate = product_certificate_fixture()
      assert {:error, %Ecto.Changeset{}} = Certificates.update_product_certificate(product_certificate, @invalid_attrs)
      assert product_certificate == Certificates.get_product_certificate!(product_certificate.id)
    end

    test "delete_product_certificate/1 deletes the product_certificate" do
      product_certificate = product_certificate_fixture()
      assert {:ok, %ProductCertificate{}} = Certificates.delete_product_certificate(product_certificate)
      assert_raise Ecto.NoResultsError, fn -> Certificates.get_product_certificate!(product_certificate.id) end
    end

    test "change_product_certificate/1 returns a product_certificate changeset" do
      product_certificate = product_certificate_fixture()
      assert %Ecto.Changeset{} = Certificates.change_product_certificate(product_certificate)
    end
  end
end
