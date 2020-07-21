defmodule TextClient.Interact do

  @game_server :game@#{node_name}
  alias TextClient.{State, Player}

  def start() do
    new_game()
    |> setup_state()
    |> Player.play()
  end

  def setup_state(game) do
    %State{
      game_service: game,
      tally: Game.tally(game),
    }
  end

  defp new_game() do
    Node.connect(@game_server)
    :rpc.call(@game_server,
      Game,
      :new_game,
      [])
  end

end
