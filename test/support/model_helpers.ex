defmodule FoodTrucksApi.ModelHelpers do
  alias FoodTrucksApi.FoodTruck
  alias FoodTrucksApi.Repo

  import Ecto.Changeset

  def new_food_truck(data \\ []) do
    %FoodTruck{
      location_id: 1,
      applicant: "tacos & more",
      facility_type: "Truck",
      cnn: 1,
      location_description: "MARKET ST: DRUMM ST intersection",
      address: "Folsom st",
      blocklot: "01234",
      block: "01",
      lot: "234",
      permit: "15MFF-0159",
      status: "REQUESTED",
      food_items: "Tacos: Burritos: Tostadas: Flautas: Tostadas: Tortas: Pozole Menudo",
      coordinate_x: "6013916.72",
      coordinate_y: "2117244.027",
      latitude: "37.794331003246846",
      longitude: "-122.39581105302317",
      schedule: "http://bsm.sfdpw.org",
      days_hours: "Mo:6AM-8PM",
      approved: "2017 Mar 16 12:00:00 AM",
      received: 20_151_231,
      prior_permit: 1,
      expiration_date: "2020 Jan 07 12:00:00 AM",
      location: "location"
    }
    |> change(data)
    |> Repo.insert!()
  end
end
