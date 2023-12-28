defmodule HelloFlyWeb.ErrorJSONTest do
  use HelloFlyWeb.ConnCase, async: true

  test "renders 404" do
    assert HelloFlyWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert HelloFlyWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
