defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller

  def new_game(conn, _params) do
    render(conn, "new_game.html")
  end

  def create_game(conn, _params) do
    game = Game.new_game()
    tally = Game.tally(game)

    conn
    |> put_session(:game, game)
    |> render("game_field.html", tally: tally)
  end

  def make_move(conn, params) do
    # raise inspect(params)
    guess = params["make_move"]["guess"]
    tally =
      conn
      |> get_session(:game)
      |> Game.make_move(guess)

    # remove previous char in the text_input
    put_in(conn.params["make_move"]["guess"], "")
    |> render("game_field.html", tally: tally)
  end
end
