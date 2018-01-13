# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cacher,
  ecto_repos: [Cacher.Repo]

# Configures the endpoint
config :cacher, CacherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DKKx+pZEuc++ompBRlUO7zWiy+kTyENY++0cuzuTgb57PJfYuM0pUdFOSuSp2+FB",
  render_errors: [view: CacherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cacher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
