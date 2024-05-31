defmodule FoodTrucksApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodTrucksApiWeb.Telemetry,
      FoodTrucksApi.Repo,
      {DNSCluster, query: Application.get_env(:food_trucks_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FoodTrucksApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FoodTrucksApi.Finch},
      # Start a worker by calling: FoodTrucksApi.Worker.start_link(arg)
      # {FoodTrucksApi.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodTrucksApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTrucksApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTrucksApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
