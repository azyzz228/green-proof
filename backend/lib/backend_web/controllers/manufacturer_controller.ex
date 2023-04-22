defmodule BackendWeb.ManufacturerController do
  use BackendWeb, :controller

  alias Backend.Entities
  alias Backend.Entities.Manufacturer

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    manufacturers = Entities.list_manufacturers()
    render(conn, :index, manufacturers: manufacturers)
  end

  def create(conn, %{"manufacturer" => manufacturer_params}) do
    with {:ok, %Manufacturer{} = manufacturer} <- Entities.create_manufacturer(manufacturer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/manufacturers/#{manufacturer}")
      |> render(:show, manufacturer: manufacturer)
    end
  end

  def show(conn, %{"id" => id}) do
    manufacturer = Entities.get_manufacturer!(id)
    render(conn, :show, manufacturer: manufacturer)
  end

  def update(conn, %{"id" => id, "manufacturer" => manufacturer_params}) do
    manufacturer = Entities.get_manufacturer!(id)

    with {:ok, %Manufacturer{} = manufacturer} <- Entities.update_manufacturer(manufacturer, manufacturer_params) do
      render(conn, :show, manufacturer: manufacturer)
    end
  end

  def delete(conn, %{"id" => id}) do
    manufacturer = Entities.get_manufacturer!(id)

    with {:ok, %Manufacturer{}} <- Entities.delete_manufacturer(manufacturer) do
      send_resp(conn, :no_content, "")
    end
  end
end
