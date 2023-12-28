defmodule HelloFly.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HelloFlyWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:hello_fly, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: HelloFly.PubSub},
      # Start a worker by calling: HelloFly.Worker.start_link(arg)
      # {HelloFly.Worker, arg},
      # Start to serve requests, typically the last entry
      HelloFlyWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloFly.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloFlyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
