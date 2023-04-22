defmodule BackendWeb.SupplierCertificateController do
  use BackendWeb, :controller

  alias Backend.Certificates
  alias Backend.Certificates.SupplierCertificate

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    supplier_certificates = Certificates.list_supplier_certificates()
    render(conn, :index, supplier_certificates: supplier_certificates)
  end

  def create(conn, %{"supplier_certificate" => supplier_certificate_params}) do
    with {:ok, %SupplierCertificate{} = supplier_certificate} <- Certificates.create_supplier_certificate(supplier_certificate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/supplier_certificates/#{supplier_certificate}")
      |> render(:show, supplier_certificate: supplier_certificate)
    end
  end

  def show(conn, %{"id" => id}) do
    supplier_certificate = Certificates.get_supplier_certificate!(id)
    render(conn, :show, supplier_certificate: supplier_certificate)
  end

  def update(conn, %{"id" => id, "supplier_certificate" => supplier_certificate_params}) do
    supplier_certificate = Certificates.get_supplier_certificate!(id)

    with {:ok, %SupplierCertificate{} = supplier_certificate} <- Certificates.update_supplier_certificate(supplier_certificate, supplier_certificate_params) do
      render(conn, :show, supplier_certificate: supplier_certificate)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier_certificate = Certificates.get_supplier_certificate!(id)

    with {:ok, %SupplierCertificate{}} <- Certificates.delete_supplier_certificate(supplier_certificate) do
      send_resp(conn, :no_content, "")
    end
  end
end
