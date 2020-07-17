defmodule Dictionary do

  alias Dictionary.WordList

  # if the fn name in WordList is not start, add `as: :fn_name`
  # defdelegate start(), to: WordList, as: :word_list
  defdelegate random_word(), to: WordList

end
