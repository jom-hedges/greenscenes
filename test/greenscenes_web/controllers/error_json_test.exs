defmodule GreenscenesWeb.ErrorJSONTest do
  use GreenscenesWeb.ConnCase, async: true

  test "renders 404" do
    assert GreenscenesWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert GreenscenesWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
