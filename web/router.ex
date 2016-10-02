defmodule SignupService.Router do
  use SignupService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SignupService do
    pipe_through :api

    post "/verify", KeyController, :verify
    post "/generate", KeyController, :generate
    post "/events", KeyController, :events
  end
end
