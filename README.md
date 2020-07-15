# Dictionary
To random select a word from a words.txt.

### How to run this application
- `iex -S mix`
- `game = Game.new_game()`
- `{ game, tally } = Game.make_move(game, "x")`
- `tally`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dictionary` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dictionary, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/dictionary](https://hexdocs.pm/dictionary).
