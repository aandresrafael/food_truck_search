defmodule FoodTrucksApi.Repo do
  use Ecto.Repo,
    otp_app: :food_trucks_api,
    adapter: Ecto.Adapters.Postgres
end
