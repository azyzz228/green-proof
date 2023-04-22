defmodule BackendWeb.SupplierControllerTest do
  use BackendWeb.ConnCase

  import Backend.EntitiesFixtures

  alias Backend.Entities.Supplier

  @create_attrs %{
    address: "some address",
    location: "some location",
    name: "some name"
  }
  @update_attrs %{
    address: "some updated address",
    location: "some updated location",
    name: "some updated name"
  }
  @invalid_attrs %{address: nil, location: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all suppliers", %{conn: conn} do
      conn = get(conn, ~p"/api/suppliers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create supplier" do
    test "renders supplier when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/suppliers", supplier: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/suppliers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "location" => "some location",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/suppliers", supplier: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update supplier" do
    setup [:create_supplier]

    test "renders supplier when data is valid", %{conn: conn, supplier: %Supplier{id: id} = supplier} do
      conn = put(conn, ~p"/api/suppliers/#{supplier}", supplier: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/suppliers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "location" => "some updated location",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, supplier: supplier} do
      conn = put(conn, ~p"/api/suppliers/#{supplier}", supplier: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete supplier" do
    setup [:create_supplier]

    test "deletes chosen supplier", %{conn: conn, supplier: supplier} do
      conn = delete(conn, ~p"/api/suppliers/#{supplier}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/suppliers/#{supplier}")
      end
    end
  end

  defp create_supplier(_) do
    supplier = supplier_fixture()
    %{supplier: supplier}
  end
end
