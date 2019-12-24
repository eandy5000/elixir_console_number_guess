defmodule Game do
  alias Game.Data, as: Data
  alias Game.View, as: View
  alias Game.Update, as: Update

  def run() do
    random_number = :rand.uniform(Data.max_rand())

    Data.new()
    |> Map.put(:number, random_number)
    |> run()
  end

  def run(:quit), do: :quit

  def run(data = %Data{}) do
    [
      View.hack_clear(),
      View.hack_clear()
    ]
    |> IO.write()

    data
    |> View.view()
    |> IO.write()

    data = %{data | error: nil}

    prompt = IO.gets("\n > ")

    data
    |> Update.update(prompt)
    |> run()
  end
end
