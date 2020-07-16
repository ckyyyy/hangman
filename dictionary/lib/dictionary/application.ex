defmodule Dictionary.Application do

  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      worker(Dictionary.WordList, []),
    ]

    options = [
      name: Dictionary.Supervisor,
      # each child process has an independent life
      # if a child dies, it alone is restarted
      strategy: :one_for_one,
    ]

    Supervisor.start_link(children, options)
  end
end
