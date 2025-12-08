defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn old_score -> old_score + score end)
  end

  def get_players(scores), do: Map.keys(scores)
end

# NOTE: it's possible to use defdelegate in most case
defmodule HighScore2 do
  @initial_score 0

  defdelegate new(), to: Map

  defdelegate add_player(scores, name, score \\ @initial_score), to: Map, as: :put

  defdelegate remove_player(scores, name), to: Map, as: :delete

  defdelegate reset_score(scores, name), to: __MODULE__, as: :add_player

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn old_score -> old_score + score end)
  end

  defdelegate get_players(scores), to: Map, as: :keys
end
