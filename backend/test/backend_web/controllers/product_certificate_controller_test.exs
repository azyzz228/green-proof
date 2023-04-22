defmodule BackendWeb.ProductCertificateControllerTest do
  use BackendWeb.ConnCase

  import Backend.CertificatesFixtures

  alias Backend.Certificates.ProductCertificate

  @create_attrs %{
    created_at: ~D[2023-04-21],
    hash: "some hash"
  }
  @update_attrs %{
    created_at: ~D[2023-04-22],
    hash: "some updated hash"
  }
  @invalid_attrs %{created_at: nil, hash: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all product_certificates", %{conn: conn} do
      conn = get(conn, ~p"/api/product_certificates")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product_certificate" do
    test "renders product_certificate when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/product_certificates", product_certificate: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/product_certificates/#{id}")

      assert %{
               "id" => ^id,
               "created_at" => "2023-04-21",
               "hash" => "some hash"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/product_certificates", product_certificate: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product_certificate" do
    setup [:create_product_certificate]

    test "renders product_certificate when data is valid", %{conn: conn, product_certificate: %ProductCertificate{id: id} = product_certificate} do
      conn = put(conn, ~p"/api/product_certificates/#{product_certificate}", product_certificate: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/product_certificates/#{id}")

      assert %{
               "id" => ^id,
               "created_at" => "2023-04-22",
               "hash" => "some updated hash"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product_certificate: product_certificate} do
      conn = put(conn, ~p"/api/product_certificates/#{product_certificate}", product_certificate: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product_certificate" do
    setup [:create_product_certificate]

    test "deletes chosen product_certificate", %{conn: conn, product_certificate: product_certificate} do
      conn = delete(conn, ~p"/api/product_certificates/#{product_certificate}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/product_certificates/#{product_certificate}")
      end
    end
  end

  defp create_product_certificate(_) do
    product_certificate = product_certificate_fixture()
    %{product_certificate: product_certificate}
  end
end
