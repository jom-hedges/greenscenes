defmodule Greenscenes.Park.Videos do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parkstreams" do
    field :description, :string
    field :title, :string
    field :s3_path, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(videos, attrs) do
    videos
    |> cast(attrs, [:title, :description, :s3_path])
    |> validate_required([:title, :description, :s3_path])
  end
end
