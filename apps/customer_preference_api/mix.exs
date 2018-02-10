defmodule CustomerPrefernceApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :customer_preference_api,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CustomerPreferenceApi, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.4"},
      {:cowboy, "~> 1.1"},
      {:hackney, "~> 1.9"},
      {:poison, "~> 3.0"}
    ]
  end
end
