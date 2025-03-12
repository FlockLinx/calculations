defmodule Calculations.Repo do
  use Ecto.Repo,
    otp_app: :calculations,
    adapter: Ecto.Adapters.Postgres
end
