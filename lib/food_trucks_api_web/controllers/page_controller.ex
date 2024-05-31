defmodule FoodTrucksApiWeb.PageController do
  use FoodTrucksApiWeb, :controller
  alias FoodTrucksApi.FoodTrucks

  def home(conn, params) do
    # The home page is often custom made,
    # so skip the default app layout.x
    food_trucks = FoodTrucks.search(params["search"]["query"])
    render(conn, :home, food_trucks: food_trucks, layout: false)
  end
end
