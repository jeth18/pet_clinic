defmodule PetClinic.PetClinicService.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :age, :integer
    field :name, :string
    field :sex, :string
    field :type, :string
    belongs_to :owner, PetClinic.OwnerService.Owner
    belongs_to :pethealthexpert, PetClinic.PetHealthExpertService.PetHealthExpert
    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :age, :type, :sex])
    |> validate_required([:name, :age, :type, :sex])
  end
end
