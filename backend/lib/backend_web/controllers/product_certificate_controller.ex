defmodule BackendWeb.ProductCertificateController do
  use BackendWeb, :controller

  alias Backend.Certificates
  alias Backend.Certificates.ProductCertificate

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    product_certificates = Certificates.list_product_certificates()
    render(conn, :index, product_certificates: product_certificates)
  end

  def create(conn, %{"product_certificate" => product_certificate_params}) do
    with {:ok, %ProductCertificate{} = product_certificate} <- Certificates.create_product_certificate(product_certificate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/product_certificates/#{product_certificate}")
      |> render(:show, product_certificate: product_certificate)
    end
  end

  def show(conn, %{"hash" => hash}) do
    product_certificate = Certificates.get_product_certificate_by_hash!(hash)
    render(conn, :show, product_certificate: product_certificate)
  end

  def update(conn, %{"id" => id, "product_certificate" => product_certificate_params}) do
    product_certificate = Certificates.get_product_certificate!(id)

    with {:ok, %ProductCertificate{} = product_certificate} <- Certificates.update_product_certificate(product_certificate, product_certificate_params) do
      render(conn, :show, product_certificate: product_certificate)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_certificate = Certificates.get_product_certificate!(id)

    with {:ok, %ProductCertificate{}} <- Certificates.delete_product_certificate(product_certificate) do
      send_resp(conn, :no_content, "")
    end
  end
end
