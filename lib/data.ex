defmodule Game.Data do
  defstruct(
    number: nil,
    guess: nil,
    error: nil,
    hint: nil,
    win: false
  )

  @max_rand 20

  def max_rand(), do: @max_rand

  def new() do
    random_number = :rand.uniform(@max_rand())

    %Game.Data{}
    |> Map.put(:number, random_number)
  end
end
