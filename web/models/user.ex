defmodule SignupService.User do
  use SignupService.Web, :model

  schema "users" do
    field :user_id, :integer

    has_many :keys, SignupService.Key

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end
end
