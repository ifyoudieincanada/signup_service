defmodule SignupService.KeyTest do
  use SignupService.ModelCase

  alias SignupService.Key

  @valid_attrs %{claimed: true, key: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Key.changeset(%Key{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Key.changeset(%Key{}, @invalid_attrs)
    refute changeset.valid?
  end
end
