defmodule HangmanTest do
  use ExUnit.Case

  alias Game.Hangman

  test "new_game returns structure" do
    game = Hangman.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "state isn't change for :won or :lost game" do
    for state <- [ :won, :lost ] do
      game = Hangman.new_game()
      |> Map.put(:game_state, state)
      assert game = Hangman.make_move(game, "x")
      # assert new_game == game
    end
  end

  test "first occurrence of letter is not already guessed" do
    game = Hangman.new_game()
    game = Hangman.make_move(game, "x")
    assert game.game_state != :already_guessed
  end

  test "second occurrence of letter is not already guessed" do
    game = Hangman.new_game()
    game = Hangman.make_move(game, "x")
    assert game.game_state != :already_guessed
    game = Hangman.make_move(game, "x")
    assert game.game_state == :already_guessed
  end

  test "a good guess is recongnized" do
    game = Hangman.new_game("wibble")
    game = Hangman.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    game = Hangman.new_game("wibble")
    game = Hangman.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Hangman.make_move(game, "i")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Hangman.make_move(game, "b")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Hangman.make_move(game, "l")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Hangman.make_move(game, "e")
    assert game.game_state == :won
    assert game.turns_left == 7
  end

  test "a bad guess is recongnized" do
    game = Hangman.new_game("wibble")
    game = Hangman.make_move(game, "a")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "a non-guessed word is a lost game" do
    game = Hangman.new_game("w")
    game = Hangman.make_move(game, "a")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
    game = Hangman.make_move(game, "b")
    assert game.game_state == :bad_guess
    assert game.turns_left == 5
    game = Hangman.make_move(game, "c")
    assert game.game_state == :bad_guess
    assert game.turns_left == 4
    game = Hangman.make_move(game, "d")
    assert game.game_state == :bad_guess
    assert game.turns_left == 3
    game = Hangman.make_move(game, "e")
    assert game.game_state == :bad_guess
    assert game.turns_left == 2
    game = Hangman.make_move(game, "f")
    assert game.game_state == :bad_guess
    assert game.turns_left == 1
    game = Hangman.make_move(game, "g")
    assert game.game_state == :lost
  end
end
