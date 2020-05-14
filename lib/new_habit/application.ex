defmodule NewHabit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      NewHabit.Repo,
      # Start the Telemetry supervisor
      NewHabitWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: NewHabit.PubSub},
      # Start the Endpoint (http/https)
      NewHabitWeb.Endpoint
      # Start a worker by calling: NewHabit.Worker.start_link(arg)
      # {NewHabit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NewHabit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NewHabitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
