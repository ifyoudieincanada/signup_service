# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :signup_service,
  ecto_repos: [SignupService.Repo]

# Configures the endpoint
config :signup_service, SignupService.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PwLo0BO/ndlUdt0ZMJFBsik3wCPWQlIv1er3VZ7KyCutS8kzUJ8sUyOUf/RwQ+Aj",
  render_errors: [view: SignupService.ErrorView, accepts: ~w(json)],
  pubsub: [name: SignupService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
