defmodule Calculations.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CalculationsWeb.Telemetry,
      Calculations.Repo,
      {DNSCluster, query: Application.get_env(:calculations, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Calculations.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Calculations.Finch},
      # Start a worker by calling: Calculations.Worker.start_link(arg)
      # {Calculations.Worker, arg},
      # Start to serve requests, typically the last entry
      CalculationsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Calculations.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CalculationsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
