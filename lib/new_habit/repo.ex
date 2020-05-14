defmodule NewHabit.Repo do
  use Ecto.Repo,
    otp_app: :new_habit,
    adapter: Ecto.Adapters.Postgres
end
