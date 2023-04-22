defmodule BackendWeb.SupplierController do
  use BackendWeb, :controller

  alias Backend.Entities
  alias Backend.Entities.Supplier

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    suppliers = Entities.list_suppliers()
    render(conn, :index, suppliers: suppliers)
  end

  def create(conn, %{"supplier" => supplier_params}) do
    with {:ok, %Supplier{} = supplier} <- Entities.create_supplier(supplier_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/suppliers/#{supplier}")
      |> render(:show, supplier: supplier)
    end
  end

  def show(conn, %{"id" => id}) do
    supplier = Entities.get_supplier!(id)
    render(conn, :show, supplier: supplier)
  end

  def update(conn, %{"id" => id, "supplier" => supplier_params}) do
    supplier = Entities.get_supplier!(id)

    with {:ok, %Supplier{} = supplier} <- Entities.update_supplier(supplier, supplier_params) do
      render(conn, :show, supplier: supplier)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier = Entities.get_supplier!(id)

    with {:ok, %Supplier{}} <- Entities.delete_supplier(supplier) do
      send_resp(conn, :no_content, "")
    end
  end
end
