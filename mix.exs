defmodule Rpi3Example.MixProject do
  use Mix.Project

  @target System.get_env("MIX_TARGET") || "host"

  def project do
    [
      app: :rpi3_example,
      version: "0.1.0",
      elixir: "~> 1.4",
      target: @target,
      compilers: [:elixir_make] ++ Mix.compilers,
      archives: [nerves_bootstrap: "~> 1.0-rc"],
      deps_path: "deps/#{@target}",
      build_path: "_build/#{@target}",
      lockfile: "mix.lock.#{@target}",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: ["loadconfig": [&bootstrap/1]],
      deps: deps()
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application, do: application(@target)

  # Specify target specific application configurations
  # It is common that the application start function will start and supervise
  # applications which could cause the host to fail. Because of this, we only
  # invoke Rpi3Example.start/2 when running on a target.
  def application("host") do
    [extra_applications: [:logger]]
  end

  def application(_target) do
    [mod: {Rpi3Example.Application, []}, extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nerves, "~> 1.0-rc.1", runtime: false},
      {:elixir_ale, "~> 1.0", },
      {:elixir_make, "~> 0.4", },

    ] ++ deps(@target)
  end

  # Specify target specific dependencies
  defp deps("host"), do: []

  defp deps(target) do
    [
      {:shoehorn, "~> 0.2"},
      {:nerves_runtime, "~> 0.5"},
      {:nerves_init_gadget, "~> 0.2"},
      {:nerves_firmware_ssh, "~> 0.2"},

    ] ++ system(target)
  end

  defp system("rpi"), do: [{:nerves_system_rpi, ">= 0.0.0", runtime: false}]
  defp system("rpi0"), do: [{:nerves_system_rpi0, ">= 0.0.0", runtime: false}]
  defp system("rpi2"), do: [{:nerves_system_rpi2, ">= 0.0.0", runtime: false}]

  defp system("rpi3"), do: [{:nerves_system_rpi3, "~> 1.0.0-rc", runtime: false}]

  defp system("bbb"), do: [{:nerves_system_bbb, ">= 0.0.0", runtime: false}]
  defp system("ev3"), do: [{:nerves_system_ev3, ">= 0.0.0", runtime: false}]
  defp system("qemu_arm"), do: [{:nerves_system_qemu_arm, ">= 0.0.0", runtime: false}]
  defp system("x86_64"), do: [{:nerves_system_x86_64, ">= 0.0.0", runtime: false}]
  defp system(target), do: Mix.raise "Unknown MIX_TARGET: #{target}"

end
