defmodule Mix.Tasks.Test.Integration do
  use Mix.Task

  @shortdoc "Runs integration tests"

  def run(args) do
    # rerun (not run) so this works both standalone and when called from the
    # test.all alias, where `mix test` will have already executed.
    Mix.Task.rerun("test", ["test/integration_test.exs", "--include", "integration"] ++ args)
  end
end
