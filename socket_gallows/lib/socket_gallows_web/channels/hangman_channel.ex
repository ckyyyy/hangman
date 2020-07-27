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
end
