defmodule BackendWeb.ManufacturerControllerTest do
  use BackendWeb.ConnCase

  import Backend.EntitiesFixtures

  alias Backend.Entities.Manufacturer

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
    test "lists all manufacturers", %{conn: conn} do
      conn = get(conn, ~p"/api/manufacturers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create manufacturer" do
    test "renders manufacturer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/manufacturers", manufacturer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/manufacturers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "location" => "some location",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/manufacturers", manufacturer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update manufacturer" do
    setup [:create_manufacturer]

    test "renders manufacturer when data is valid", %{conn: conn, manufacturer: %Manufacturer{id: id} = manufacturer} do
      conn = put(conn, ~p"/api/manufacturers/#{manufacturer}", manufacturer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/manufacturers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "location" => "some updated location",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, manufacturer: manufacturer} do
      conn = put(conn, ~p"/api/manufacturers/#{manufacturer}", manufacturer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete manufacturer" do
    setup [:create_manufacturer]

    test "deletes chosen manufacturer", %{conn: conn, manufacturer: manufacturer} do
      conn = delete(conn, ~p"/api/manufacturers/#{manufacturer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/manufacturers/#{manufacturer}")
      end
    end
  end

  defp create_manufacturer(_) do
    manufacturer = manufacturer_fixture()
    %{manufacturer: manufacturer}
  end
end
