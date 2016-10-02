defmodule SignupService do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(SignupService.Repo, []),
      # Start the endpoint when the application starts
      supervisor(SignupService.Endpoint, []),
      # Start your own worker by calling: SignupService.Worker.start_link(arg1, arg2, arg3)
      # worker(SignupService.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SignupService.Supervisor]
    Supervisor.start_link(children, opts)

    #SignupService.Subscriber.subscribe
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SignupService.Endpoint.config_change(changed, removed)
    :ok
  end
end
