defmodule Greenscenes.Repo.Migrations.CreateParkstreams do
  use Ecto.Migration

  def change do
    create table(:parkstreams) do
      add :title, :string
      add :description, :text
      add :s3_path, :string

      timestamps(type: :utc_datetime)
    end
  end
end
