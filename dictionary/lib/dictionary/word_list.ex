defmodule Dictionary.WordList do

  @me __MODULE__

  # {:ok, pid } = Agent.start_link(fn -> 0 end)
  # Agent.get(pid, fn count -> count end)
  # Agent.update(pid, fn count -> count + 1 end)
  # Agent.get_and_update(pid, fn count -> {count, count + 1} end)

  # separate the process
  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end

  def random_word() do
    # if :rand.uniform < 0.33 do
    #   Agent.get(@me, fn _ -> exit(:boom) end)
    # end
    Agent.get(@me, &Enum.random/1)
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
