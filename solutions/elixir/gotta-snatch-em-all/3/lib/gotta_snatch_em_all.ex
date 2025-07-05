defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card), do: MapSet.new([card])

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection), do: {MapSet.member?(collection, card), MapSet.put(collection, card)}

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    possible? = MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card)
    new_set =
      collection
      |> MapSet.delete(your_card)
      |> MapSet.put(their_card)

    {possible?, new_set}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards), do: cards |> MapSet.new() |> MapSet.to_list()

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection
    |> MapSet.difference(their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []
  def boring_cards([head | rest]) do
    rest
    |> Enum.reduce(head, fn c, acc -> MapSet.intersection(acc, c) end)
    |> MapSet.to_list()
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards([]), do: 0
  def total_cards(collections) do
    collections
    |> Enum.concat()
    |> MapSet.new()
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny, rest} = MapSet.split_with(collection, fn name -> String.starts_with?(name, "Shiny") end)

    {MapSet.to_list(shiny), MapSet.to_list(rest)}
  end
end
