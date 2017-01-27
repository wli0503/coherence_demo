defmodule Webapp.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      # authenticatable
      add :password_hash, :string
      add :admin, :boolean, default: false
      
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
