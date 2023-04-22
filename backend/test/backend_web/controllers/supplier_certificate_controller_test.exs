defmodule BackendWeb.SupplierCertificateControllerTest do
  use BackendWeb.ConnCase

  import Backend.CertificatesFixtures

  alias Backend.Certificates.SupplierCertificate

  @create_attrs %{
    isFairTrade: true,
    isLocallyOwned: true,
    isRegenerative: true,
    manufacturer: "some manufacturer",
    productName: "some productName",
    quantity: 42,
    supplier: "some supplier",
    the_id: 42
  }
  @update_attrs %{
    isFairTrade: false,
    isLocallyOwned: false,
    isRegenerative: false,
    manufacturer: "some updated manufacturer",
    productName: "some updated productName",
    quantity: 43,
    supplier: "some updated supplier",
    the_id: 43
  }
  @invalid_attrs %{isFairTrade: nil, isLocallyOwned: nil, isRegenerative: nil, manufacturer: nil, productName: nil, quantity: nil, supplier: nil, the_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all supplier_certificates", %{conn: conn} do
      conn = get(conn, ~p"/api/supplier_certificates")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create supplier_certificate" do
    test "renders supplier_certificate when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/supplier_certificates", supplier_certificate: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/supplier_certificates/#{id}")

      assert %{
               "id" => ^id,
               "isFairTrade" => true,
               "isLocallyOwned" => true,
               "isRegenerative" => true,
               "manufacturer" => "some manufacturer",
               "productName" => "some productName",
               "quantity" => 42,
               "supplier" => "some supplier",
               "the_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/supplier_certificates", supplier_certificate: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update supplier_certificate" do
    setup [:create_supplier_certificate]

    test "renders supplier_certificate when data is valid", %{conn: conn, supplier_certificate: %SupplierCertificate{id: id} = supplier_certificate} do
      conn = put(conn, ~p"/api/supplier_certificates/#{supplier_certificate}", supplier_certificate: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/supplier_certificates/#{id}")

      assert %{
               "id" => ^id,
               "isFairTrade" => false,
               "isLocallyOwned" => false,
               "isRegenerative" => false,
               "manufacturer" => "some updated manufacturer",
               "productName" => "some updated productName",
               "quantity" => 43,
               "supplier" => "some updated supplier",
               "the_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, supplier_certificate: supplier_certificate} do
      conn = put(conn, ~p"/api/supplier_certificates/#{supplier_certificate}", supplier_certificate: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete supplier_certificate" do
    setup [:create_supplier_certificate]

    test "deletes chosen supplier_certificate", %{conn: conn, supplier_certificate: supplier_certificate} do
      conn = delete(conn, ~p"/api/supplier_certificates/#{supplier_certificate}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/supplier_certificates/#{supplier_certificate}")
      end
    end
  end

  defp create_supplier_certificate(_) do
    supplier_certificate = supplier_certificate_fixture()
    %{supplier_certificate: supplier_certificate}
  end
end
