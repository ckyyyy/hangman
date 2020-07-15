defmodule Game.Hangman do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    guessed: MapSet.new()
  )

  def new_game(word) do
  %Game.Hangman{
    letters: word
    |> String.codepoints
  }
  end

  def new_game() do
    new_game(Dictionary.random_word)
  end

  def make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    # { game, tally(game) }
    game
  end

  def make_move(game, guess) do
    game = accept_move(game, guess, MapSet.member?(game.guessed, guess))
    # { game, tally(game) }
  end

  def tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters: game.letters |> reveal_guessed(game.guessed),
    }
  end

  #########################################


  defp accept_move(game, _guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_guessed)
  end

  defp accept_move(game, guess, _already_guessed) do
    # use list for guessed: []
    # Map.put(game, :guessed, [guess | game.guessed])
    Map.put(game, :guessed, MapSet.put(game.guessed, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, _good_guess = true) do
    # won? -> :won, :good_guess
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.guessed)
    |> maybe_won()
    Map.put(game, :game_state, new_state)
  end

  defp score_guess(game = %{ turns_left: 1}, _not_good_guess) do
    # dec turns left
    # 0? :lost, :bad_guess
    Map.put(game, :game_state, :lost)
  end

  defp score_guess(game = %{ turns_left: turns_left}, _not_good_guess) do
    # dec turns left
    # 0? :lost, :bad_guess
    # Map.put(game, :game_state, :bad_guess) |> Map.put(:turns_left, turns_left - 1)
    %{ game |
      game_state: :bad_guess,
      turns_left: turns_left - 1
    }
  end

  defp reveal_guessed(letters, guessed) do
    letters
    |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(guessed, letter)) end)
  end

  defp reveal_letter(letter, _in_word = true), do: letter
  defp reveal_letter(letter, _not_in_word), do: "_"

  defp maybe_won(true), do:  :won
  defp maybe_won(_), do: :good_guess
end
