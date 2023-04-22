defmodule Backend.Repo.Migrations.CreateSupplierCertificates do
  use Ecto.Migration

  def change do
    create table(:supplier_certificates) do
      add :supplier, :string, null: false
      add :manufacturer, :string, null: false
      add :isLocallyOwned, :boolean, default: false, null: false
      add :isRegenerative, :boolean, default: false, null: false
      add :isFairTrade, :boolean, default: false, null: false
      add :quantity, :integer, null: false
      add :productName, :string, null: false
      add :the_id, :integer, null: false

      timestamps()
    end
  end
end
