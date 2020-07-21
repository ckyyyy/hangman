defmodule Game do

  # alias Game.Hangman
  # alias Game.Server

  #API module
  # defdelegate new_game(), to: Hangman
  # defdelegate make_move(game, guess), to: Hangman
  # defdelegate tally(game), to: Hangman

  # def make_move(game, guess) do
  #   game = Hangman.make_move(game, guess)
  #   { game, tally(game) }
  # end

  def new_game() do
    # Server.start_link()
    { :ok, pid } = Supervisor.start_child(Game.Supervisor, [])
    pid
  end

  def tally(game_pid) do
    GenServer.call(game_pid, { :tally })
  end

  def make_move(game_pid, guess) do
    GenServer.call(game_pid, { :make_move, guess })
  end

end
