defmodule Builder.HttpRequestBuilder do
  def body() do
    %{"preferences" => %{}}
  end

  @spec with_customer_id(body :: map, id:: String.t) :: map
  def with_customer_id(body, id) do
    Map.put(body, "customerId", id)
  end

  def with_preference(body, category_name, channel_name) do
    default_preference = %{"status" => false, "thirdParty" => false}

    if(is_nil(body["preferences"][category_name])) do
      data_lens = Lens.make_lens("preferences")

      existing_categories = body["preferences"]
      updated_categories = Map.put(existing_categories, category_name, %{channel_name => default_preference})

      data_lens
      |> Focus.set(body, updated_categories)
    else
      data_lens = Lens.make_lens("preferences")
      category_lens = Lens.make_lens(category_name)

      existing_channels = body["preferences"][category_name]
      updated_channels = Map.put(existing_channels, channel_name, default_preference)

      data_lens
      |> Focus.compose(category_lens)
      |> Focus.set(body, updated_channels)
    end
  end

  def with_status(body, category, channel, consent_status) do
    preference_update(body, category, channel, "status", consent_status)
  end

  def with_third_party_status(body, category, channel, third_party_status) do
    preference_update(body, category, channel, "thirdParty", third_party_status)
  end

  defp preference_update(body, category, channel, consent_property, consent_value) do
    data_lens = Lens.make_lens("preferences")
    category_lens = Lens.make_lens(category)
    channel_lens = Lens.make_lens(channel)
    consent_property_lens = Lens.make_lens(consent_property)

    data_lens
    |> Focus.compose(category_lens)
    |> Focus.compose(channel_lens)
    |> Focus.compose(consent_property_lens)
    |> Focus.set(body, consent_value)
  end
end
