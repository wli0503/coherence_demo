# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :webapp,
  ecto_repos: [Webapp.Repo]

# Configures the endpoint
config :webapp, Webapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qs8Or8JJb/nuoa5JhiyPnshe1bqhD3SWNM/RywIcJB0M9eriKf5MVesbmM0v+DEG",
  render_errors: [view: Webapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Webapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Webapp.User,
  repo: Webapp.Repo,
  module: Webapp,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
