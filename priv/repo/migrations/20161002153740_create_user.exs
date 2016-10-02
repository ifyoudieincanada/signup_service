defmodule SignupService.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :integer

      timestamps()
    end

    alter table(:keys) do
      add :user_id, references(:users)
    end

  end
end
