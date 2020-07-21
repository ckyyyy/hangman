defmodule Game.Application do

  use Application

  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    children = [
      worker(Game.Server, []),
    ]

    options = [
      name: Game.Supervisor,
      # each child process has an independent life
      # if a child dies, it alone is restarted
      # when create supervisor, it does not start any child
      # call Supervisor.start_child to kick off a new supervisor process for it
      strategy: :simple_one_for_one,
    ]

    # call start_link() of each of the child in the children list
    Supervisor.start_link(children, options)
  end
end
