# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :c4m,
  ecto_repos: [C4m.Repo]

# Configures the endpoint
config :c4m, C4m.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LebC/sRHeGI/spujQY0TMNFPVasqP4FxEWeaPsAdgJHStP1zw9mvO0UVosPDdr2f",
  render_errors: [view: C4m.ErrorView, accepts: ~w(html json)],
  pubsub: [name: C4m.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "C4m",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "DSDSDSDDDASaa",
  serializer: C4m.GuardianSerializer

