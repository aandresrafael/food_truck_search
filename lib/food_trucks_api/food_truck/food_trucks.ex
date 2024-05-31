defmodule FoodTrucksApi.FoodTrucks do
  alias FoodTrucksApi.{Repo, FoodTruck}
  import Ecto.Query

  def search(search_term) do
    query =
      from(ft in FoodTruck,
        distinct: true,
        where:
          ilike(ft.applicant, ^"%#{search_term}%") or
            ilike(ft.address, ^"%#{search_term}%") or
            ilike(ft.address, ^"%#{search_term}%")
      )

    Repo.all(query)
  end
end
