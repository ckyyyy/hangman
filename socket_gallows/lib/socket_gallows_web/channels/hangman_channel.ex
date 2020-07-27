defmodule SocketGallowsWeb.HangmanChannel do

  use Phoenix.Channel

  def join("hangman:game", _, socket) do
    game = Game.new_game()
    socket = assign(socket, :game, game)
    { :ok, socket }
  end


  # server handle incoming message
  def handle_in("tally", _, socket) do
    game = socket.assigns.game
    tally = Game.tally(game)
    push(socket, "tally", tally)
    { :noreply, socket }
  end

  def handle_in("make_move", guess, socket) do
    tally = socket.assigns.game |> Game.make_move(guess)
    push(socket, "tally", tally)
    { :noreply, socket }
  end

  def handle_in("new_game", _, socket) do
    socket = socket |> assign(:game, Game.new_game())
    handle_in("tally", nil, socket)
  end

end
