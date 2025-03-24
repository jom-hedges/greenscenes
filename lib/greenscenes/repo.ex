defmodule Greenscenes.Repo do
  use Ecto.Repo,
    otp_app: :greenscenes,
    adapter: Ecto.Adapters.Postgres
end
