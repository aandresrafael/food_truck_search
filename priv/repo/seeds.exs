# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTrucksApi.Repo.insert!(%FoodTrucksApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule FoodTrucksApi.DatabaseSeeder do
  alias FoodTrucksApi.FoodTruck
  alias FoodTrucksApi.Repo

  def seed do
    if !already_seeded?() do
      seed_food_trucks()
    end
  end

  def already_seeded?() do
    Repo.all(FoodTruck) |> Enum.any?()
  end

  def seed_food_trucks do
    "../repo/Mobile_Food_Facility_Permit.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(&create_food_truck(&1))
  end

  def create_food_truck({:ok, food_truck}) do
    %FoodTruck{
      location_id: food_truck["locationid"] |> Integer.parse() |> elem(0),
      applicant: food_truck["Applicant"],
      facility_type: food_truck["FacilityType"],
      cnn: food_truck["cnn"] |> Integer.parse() |> elem(0),
      location_description: food_truck["LocationDescription"],
      address: food_truck["Address"],
      blocklot: food_truck["blocklot"],
      block: food_truck["block"],
      lot: food_truck["lot"],
      permit: food_truck["permit"],
      status: food_truck["Status"],
      food_items: food_truck["FoodItems"],
      coordinate_x: food_truck["X"],
      coordinate_y: food_truck["Y"],
      latitude: food_truck["Latitude"],
      longitude: food_truck["Longitude"],
      schedule: food_truck["Schedule"],
      days_hours: food_truck["dayshours"],
      noisent: food_truck["NOISent"],
      approved: food_truck["Approved"],
      received: food_truck["Received"] |> Integer.parse() |> elem(0),
      prior_permit: food_truck["PriorPermit"] |> Integer.parse() |> elem(0),
      expiration_date: food_truck["ExpirationDate"],
      location: food_truck["Location"]
    }
    |> Repo.insert!()
  end
end

FoodTrucksApi.DatabaseSeeder.seed()
