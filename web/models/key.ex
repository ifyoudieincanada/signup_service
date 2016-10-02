defmodule SignupService.Key do
  use SignupService.Web, :model

  schema "keys" do
    field :key, :string
    field :claimed, :boolean, default: false

    belongs_to :user, SignupService.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key, :claimed])
    |> validate_required([:key, :claimed])
  end
end
