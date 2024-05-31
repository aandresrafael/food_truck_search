defmodule FoodTrucksApi.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_truck" do
    timestamps()
    field :location_id, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :coordinate_x, :string
    field :coordinate_y, :string
    field :latitude, :string
    field :longitude, :string
    field :schedule, :string
    field :days_hours, :string
    field :noisent, :string
    field :approved, :string
    field :received, :integer
    field :prior_permit, :integer
    field :expiration_date, :string
    field :location, :string
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :coordinate_x,
      :coordinate_y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noisent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date,
      :location
    ])
    |> validate_required([:location_id, :applicant])
  end
end
