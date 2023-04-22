defmodule Backend.Repo.Migrations.CreateProductCertificates do
  use Ecto.Migration

  def change do
    create table(:product_certificates) do
      add :hash, :string, null: false
      add :created_at, :date, null: false
      add :manufacturer, references(:manufacturer_certificates, on_delete: :nothing)

      timestamps()
    end

    create index(:product_certificates, [:manufacturer])
  end
end
