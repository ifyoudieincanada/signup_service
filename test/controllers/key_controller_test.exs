defmodule SignupService.KeyControllerTest do
  use SignupService.ConnCase

  alias SignupService.Key
  @valid_attrs %{claimed: true, key: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, key_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    key = Repo.insert! %Key{}
    conn = get conn, key_path(conn, :show, key)
    assert json_response(conn, 200)["data"] == %{"id" => key.id,
      "key" => key.key,
      "claimed" => key.claimed}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, key_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, key_path(conn, :create), key: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Key, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, key_path(conn, :create), key: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    key = Repo.insert! %Key{}
    conn = put conn, key_path(conn, :update, key), key: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Key, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    key = Repo.insert! %Key{}
    conn = put conn, key_path(conn, :update, key), key: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    key = Repo.insert! %Key{}
    conn = delete conn, key_path(conn, :delete, key)
    assert response(conn, 204)
    refute Repo.get(Key, key.id)
  end
end
