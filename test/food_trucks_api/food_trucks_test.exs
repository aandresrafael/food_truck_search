defmodule FoodTrucksApi.FoodTrucksTest do
  use FoodTrucksApi.DataCase
  alias FoodTrucksApi.FoodTrucks

  describe "#search" do
    test "search by applicant name" do
      new_food_truck(%{applicant: "hot dogs"})
      new_food_truck()
      food_trucks = FoodTrucks.search("tacos")

      assert(length(food_trucks)) == 1
      assert List.first(food_trucks).applicant == "tacos & more"
    end

    test "search by address" do
      new_food_truck()
      new_food_truck(%{address: "folsom 17"})
      food_trucks = FoodTrucks.search("folsom")

      assert(length(food_trucks)) == 2
    end

    test "serach by location" do
      new_food_truck()
      new_food_truck(%{address: "market st 139"})
      food_trucks = FoodTrucks.search("market st")

      assert(length(food_trucks)) == 2
    end
  end
end
