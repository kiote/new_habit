# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :new_habit,
  ecto_repos: [NewHabit.Repo]

# Configures the endpoint
config :new_habit, NewHabitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QMTfQZlinGlY3azYhlw4I7i3V83OlCB4hptPaqAKkRFnXZ0wCk0zW8Gz3eCqselw",
  render_errors: [view: NewHabitWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: NewHabit.PubSub,
  live_view: [signing_salt: "ThYSyfsG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
