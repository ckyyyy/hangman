defmodule Game do

  alias Game.Hangman

  #API module
  defdelegate new_game(), to: Hangman
  # defdelegate make_move(game, guess), to: Hangman
  defdelegate tally(game), to: Hangman

  def make_move(game, guess) do
    game = Hangman.make_move(game, guess)
    { game, tally(game) }
  end
end
