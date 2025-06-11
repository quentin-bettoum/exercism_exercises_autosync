defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score) do
    scores
    |> Map.put(name, score)
  end

  def remove_player(scores, name) do
    scores
    |> Map.delete(name)
  end

  def reset_score(scores, name) do
    scores
    |> Map.put(name, @initial_score)
  end

  def update_score(scores, name, score) do
    scores
    |> Map.update(name, score, fn old_score -> old_score + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
