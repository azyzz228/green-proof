defmodule Backend.Repo.Migrations.CreateSuppliers do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string, null: false
      add :location, :string, null: false
      add :address, :string, null: false

      timestamps()
    end
  end
end
