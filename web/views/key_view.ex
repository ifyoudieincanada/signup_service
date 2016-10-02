defmodule SignupService.KeyView do
  use SignupService.Web, :view

  def render("index.json", %{keys: keys}) do
    %{data: render_many(keys, SignupService.KeyView, "key.json")}
  end

  def render("show.json", %{key: key}) do
    %{data: render_one(key, SignupService.KeyView, "key.json")}
  end

  def render("key.json", %{key: key}) do
    %{id: key.id,
      key: key.key,
      claimed: key.claimed}
  end
end
