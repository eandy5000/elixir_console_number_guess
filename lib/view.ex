defmodule Game.View do
  alias Game.Data, as: Data

  def view(data) do
    [
      game_title(),
      display_error(data.error),
      display_hint(data.hint, data.win, data.guess),
      display_win_msg(data.win),
      display_directions(data.win)
    ]
  end

  def display_error(error) when is_nil(error), do: []

  def display_error(error) do
    "ERROR: #{error}\n"
  end

  def display_directions(win) when win == false do
    directions_start()
  end

  def display_directions(win) when win == true do
    directions_end()
  end

  def display_win_msg(win) when win == true do
    win_message()
  end

  def display_win_msg(_win) do
    []
  end

  def display_hint(hint, win, guess) when is_binary(hint) and win == false do
    hint_msg(hint, guess)
  end

  def display_hint(_hint, _win, _guess) do
    []
  end

  def win_message() do
    "You win!!!\n"
  end

  def game_title() do
    [
      "GUESS THE NUMBER!!!",
      return(),
      "-----------------------------------",
      return()
    ]
  end

  def hint_msg(hint, guess) do
    "HINT: try #{hint} than #{guess} \n"
  end

  def directions_start() do
    "Directions: enter a number between 1 and #{Data.max_rand()}\n"
  end

  def directions_end() do
    "Directions: (a)gain (q)uit \n"
  end

  def return(), do: "\n"

  def hack_clear() do
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  end
end
