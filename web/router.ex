defmodule SignupService.Router do
  use SignupService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SignupService do
    pipe_through :api
  end
end
