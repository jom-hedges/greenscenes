defmodule Greenscenes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GreenscenesWeb.Telemetry,
      Greenscenes.Repo,
      {DNSCluster, query: Application.get_env(:greenscenes, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Greenscenes.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Greenscenes.Finch},
      # Start a worker by calling: Greenscenes.Worker.start_link(arg)
      # {Greenscenes.Worker, arg},
      # Start to serve requests, typically the last entry
      GreenscenesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Greenscenes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GreenscenesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
