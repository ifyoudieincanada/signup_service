defmodule SignupService.KeyController do
  use SignupService.Web, :controller

  alias SignupService.Key

  def verify(conn, %{"key" => key}) do
    case Repo.one(from k in Key, where: k.key == ^key) do
      nil ->
        render(conn, SignupService.ErrorView, "404.json", %{})
      key ->
        if key.claimed do
          render(conn, SignupService.ErrorView, "401.json", %{})
        else
          changeset = Key.changeset(key, %{claimed: true})
          case Repo.insert(changeset) do
            {:ok, key} ->
              render(conn, "show.json", key: key)
            {:error, changeset} ->
              conn
              |> put_status(:unprocessable_entity)
              |> render(SignupService.ChangesetView, "error.json", changeset: changeset)
          end
        end
    end
  end

  def generate(conn, %{"token" => token, "size" => size}) do
    case UserClient.User.verify(%UserClient.User{token: token}) do
      {:ok, user} ->
        case UserClient.User.has_permission?(user, "admin") do
          {:ok, true} ->
            keys = Enum.map(1..size, fn _ ->
              generate_key
            end)
            render(conn, "index.json", keys: keys)
          {:error, _} ->
            render(conn, SignupService.ErrorView, "401.json", %{})
        end
      {:error, _} ->
        render(conn, SignupService.ErrorView, "401.json", %{})
    end
  end

  defp generate_key do
    key = do_generate_key

    case Repo.one(from k in Key, where: k.key == ^key) do
      nil ->
        case Repo.insert(%Key{key: key, claimed: false}) do
          {:ok, key} -> key
          {:error, _} -> generate_key
        end
      _ ->
        generate_key
    end
  end

  defp do_generate_key do
    Enum.map(1..8, fn _ ->
      <<:rand.uniform(26) + 64>>
    end)
    |> Enum.join
  end
end
