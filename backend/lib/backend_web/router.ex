defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    resources "/manufacturer_certificates", ManufacturerCertificateController, except: [:new, :edit]
    resources "/supplier_certificates", SupplierCertificateController, except: [:new, :edit]
    resources "/manufacturers", ManufacturerController, except: [:new, :edit]
    resources "/suppliers", SupplierController, except: [:new, :edit]
    resources "/product_certificates", ProductCertificateController, except: [:new, :edit]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BackendWeb.Telemetry
    end
  end
end
