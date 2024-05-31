defmodule FoodTrucksApi.Repo.Migrations.CreateFoodTruck do
  use Ecto.Migration

  def change do
    create table(:food_truck) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :coordinate_x, :string
      add :coordinate_y, :string
      add :latitude, :string
      add :longitude, :string
      add :schedule, :string
      add :days_hours, :string
      add :noisent, :string
      add :approved, :string
      add :received, :integer
      add :prior_permit, :integer
      add :expiration_date, :string
      add :location, :string
      timestamps()
    end

    create(index(:food_truck, [:applicant]))
    create(index(:food_truck, [:location_description]))
    create(index(:food_truck, [:address]))
  end
end
