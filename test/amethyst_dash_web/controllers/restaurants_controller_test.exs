defmodule AmethystDashWeb.RestaurantsControllerTest do
 use AmethystDashWeb.ConnCase

 describe "create/2" do
  test "When input is valid, create user", %{conn: conn} do
    params = %{name: "Restaurant1", email: "res@res.com"}

    response =
      conn
      |> post(Routes.restaurants_path(conn, :create, params))
      |> json_response(:created)

    assert %{"message" => "Restaurant created", "restaurant" => %{"email" => "res@res.com", "id" => _id, "name" => "Restaurant1"}} = response
  end

  test "When input is invalid, return errors", %{conn: conn} do
    params = %{name: "Restaurant1"}

    response =
      conn
      |> post(Routes.restaurants_path(conn, :create, params))
      |> json_response(:bad_request)

    assert response == %{"message" => %{"email" => ["can't be blank"]}}
  end
 end
end
