defmodule TextClient.Interact do

  alias TextClient.{State, Player}

  def start() do
    Game.new_game()
    |> setup_state()
    |> Player.play()
  end

  def setup_state(game) do
    %State{
      game_service: game,
      tally: Game.tally(game),
    }
  end

end
