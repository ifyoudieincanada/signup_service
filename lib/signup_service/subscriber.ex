defmodule SignupService.Subscriber do
  def subscribe do
    case EventClient.subscribe("user.create", SignupService.Endpoint.url) do
      {:ok, _} -> :ok
      {:error, _} -> subscribe
    end
  end
end
