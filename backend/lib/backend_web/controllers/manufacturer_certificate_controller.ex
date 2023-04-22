defmodule BackendWeb.ManufacturerCertificateController do
  use BackendWeb, :controller

  alias Backend.Certificates
  alias Backend.Certificates.ManufacturerCertificate

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    manufacturer_certificates = Certificates.list_manufacturer_certificates()
    render(conn, :index, manufacturer_certificates: manufacturer_certificates)
  end

  def create(conn, %{"manufacturer_certificate" => manufacturer_certificate_params}) do
    with {:ok, %ManufacturerCertificate{} = manufacturer_certificate} <- Certificates.create_manufacturer_certificate(manufacturer_certificate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/manufacturer_certificates/#{manufacturer_certificate}")
      |> render(:show, manufacturer_certificate: manufacturer_certificate)
    end
  end

  def show(conn, %{"id" => id}) do
    manufacturer_certificate = Certificates.get_manufacturer_certificate!(id)
    render(conn, :show, manufacturer_certificate: manufacturer_certificate)
  end

  def update(conn, %{"id" => id, "manufacturer_certificate" => manufacturer_certificate_params}) do
    manufacturer_certificate = Certificates.get_manufacturer_certificate!(id)

    with {:ok, %ManufacturerCertificate{} = manufacturer_certificate} <- Certificates.update_manufacturer_certificate(manufacturer_certificate, manufacturer_certificate_params) do
      render(conn, :show, manufacturer_certificate: manufacturer_certificate)
    end
  end

  def delete(conn, %{"id" => id}) do
    manufacturer_certificate = Certificates.get_manufacturer_certificate!(id)

    with {:ok, %ManufacturerCertificate{}} <- Certificates.delete_manufacturer_certificate(manufacturer_certificate) do
      send_resp(conn, :no_content, "")
    end
  end
end
