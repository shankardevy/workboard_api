import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :workboard_api, WorkboardApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "99d3cS2hYqvou/ixa7sCCP08hobGFUuOXWPGUZDtoWVq1lzmI9B9WHo3R5+9ylU/",
  server: false

# In test we don't send emails
config :workboard_api, WorkboardApi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
