defmodule Game.Server do

  alias Game.Hangman

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    { :ok, Hangman.new_game() }
  end

  def handle_call({ :make_move, guess }, _from, game) do
    { game, tally } = Hangman.make_move(game, guess)
    { :reply, tally, game }
  end

  def handle_call({ :tally }, _from, game) do
    { :reply, Hangman.tally(game), game }
  end
end
