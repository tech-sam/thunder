defmodule Discuss.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :bio])
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 1)
    |> validate_format(:email, ~r/@/)
  end
end
