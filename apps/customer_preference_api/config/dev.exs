use Mix.Config

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role]

config :ex_aws, :dynamodb,
  scheme: "http://",
  host: "localhost",
  port: 8889,
  region: "eu-west-1"

config :customer_preference_api,
  header_validators: [Validation.RequestParameterValidator,
                      Validation.CustomerRestriction
  ],
  body_validators: [Validation.Body.PreferencesValidation,
                    Validation.Body.AccommodationValidation]
