defmodule Gse2csgoai.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: Gse2csgoai.Router, options: [port: 8080])
      # Starts a worker by calling: Gse2csgoai.Worker.start_link(arg)
      # {Gse2csgoai.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gse2csgoai.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
