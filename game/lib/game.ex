defmodule Game do
  @moduledoc """
  Documentation for `Game`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Game.hello()
      :world

  """
  def hello do
    IO.puts Dictionary.random_word()
  end
end
