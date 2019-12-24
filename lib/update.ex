defmodule Game.Update do
  alias Game.Data, as: Data

  def update(game, cmd) when is_binary(cmd) do
    parsed = Integer.parse(cmd)
    update(game, cmd, parsed)
  end

  def update(game, _cmd, parsedCmd) when is_tuple(parsedCmd) do
    {guess, _} = parsedCmd
    handle_guess(game, guess, game.number)
  end

  def update(game, cmd, :error) do
    handle_text_cmd(game, cmd, game.win)
  end

  def handle_text_cmd(game, _cmd, win) when win == false do
    %{game | error: "invalid command pick a number"}
  end

  def handle_text_cmd(_game, "q" <> _, win) when win == true, do: :quit

  def handle_text_cmd(_game, "a" <> _, win) when win == true do
    Data.new()
  end

  def handle_text_cmd(game, _cmd, _win = true) do
    %{game | error: "invalid command try again"}
  end

  def handle_guess(game, guess, number) when guess == number do
    %{game | guess: guess, win: true}
  end

  def handle_guess(game, guess, number) when guess > number do
    %{game | guess: guess, hint: "lower"}
  end

  def handle_guess(game, guess, number) when guess < number do
    %{game | guess: guess, hint: "higher"}
  end
end
