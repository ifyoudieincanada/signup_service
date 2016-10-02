defmodule SignupService.Repo.Migrations.CreateKey do
  use Ecto.Migration

  def change do
    create table(:keys) do
      add :key, :string
      add :claimed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
