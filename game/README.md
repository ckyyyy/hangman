# Hangman Game
To guess a word with limited chances.

Dictionary would generate a word for Hangman
Game would call APIs to Hangman

### How to run this application
- `iex -S mix`
- `game = Game.new_game()`
- `{ game, tally } = Game.make_move(game, "x")`
- `tally`
![image](https://github.com/ckyyyy/hangman/blob/master/image/hangman_game_tally.png)
