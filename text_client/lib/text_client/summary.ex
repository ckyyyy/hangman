defmodule TextClient.Summary do

  def display(game = %{ tally: tally }) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "Guess left: #{tally.turns_left}\n",
      "Guessed letters: #{Enum.join(tally.guessed, " ")}\n",
    ]
    game
  end

end
