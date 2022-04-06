defmodule PetClinic.PetHealthExpertServiceTest do
  use PetClinic.DataCase

  alias PetClinic.PetHealthExpertService

  describe "pethealthexperts" do
    alias PetClinic.PetHealthExpertService.PetHealthExpert

    import PetClinic.PetHealthExpertServiceFixtures

    @invalid_attrs %{age: nil, email: nil, name: nil, sex: nil, specialities: nil}

    test "list_pethealthexperts/0 returns all pethealthexperts" do
      pet_health_expert = pet_health_expert_fixture()
      assert PetHealthExpertService.list_pethealthexperts() == [pet_health_expert]
    end

    test "get_pet_health_expert!/1 returns the pet_health_expert with given id" do
      pet_health_expert = pet_health_expert_fixture()
      assert PetHealthExpertService.get_pet_health_expert!(pet_health_expert.id) == pet_health_expert
    end

    test "create_pet_health_expert/1 with valid data creates a pet_health_expert" do
      valid_attrs = %{age: 42, email: "some email", name: "some name", sex: "some sex", specialities: "some specialities"}

      assert {:ok, %PetHealthExpert{} = pet_health_expert} = PetHealthExpertService.create_pet_health_expert(valid_attrs)
      assert pet_health_expert.age == 42
      assert pet_health_expert.email == "some email"
      assert pet_health_expert.name == "some name"
      assert pet_health_expert.sex == "some sex"
      assert pet_health_expert.specialities == "some specialities"
    end

    test "create_pet_health_expert/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PetHealthExpertService.create_pet_health_expert(@invalid_attrs)
    end

    test "update_pet_health_expert/2 with valid data updates the pet_health_expert" do
      pet_health_expert = pet_health_expert_fixture()
      update_attrs = %{age: 43, email: "some updated email", name: "some updated name", sex: "some updated sex", specialities: "some updated specialities"}

      assert {:ok, %PetHealthExpert{} = pet_health_expert} = PetHealthExpertService.update_pet_health_expert(pet_health_expert, update_attrs)
      assert pet_health_expert.age == 43
      assert pet_health_expert.email == "some updated email"
      assert pet_health_expert.name == "some updated name"
      assert pet_health_expert.sex == "some updated sex"
      assert pet_health_expert.specialities == "some updated specialities"
    end

    test "update_pet_health_expert/2 with invalid data returns error changeset" do
      pet_health_expert = pet_health_expert_fixture()
      assert {:error, %Ecto.Changeset{}} = PetHealthExpertService.update_pet_health_expert(pet_health_expert, @invalid_attrs)
      assert pet_health_expert == PetHealthExpertService.get_pet_health_expert!(pet_health_expert.id)
    end

    test "delete_pet_health_expert/1 deletes the pet_health_expert" do
      pet_health_expert = pet_health_expert_fixture()
      assert {:ok, %PetHealthExpert{}} = PetHealthExpertService.delete_pet_health_expert(pet_health_expert)
      assert_raise Ecto.NoResultsError, fn -> PetHealthExpertService.get_pet_health_expert!(pet_health_expert.id) end
    end

    test "change_pet_health_expert/1 returns a pet_health_expert changeset" do
      pet_health_expert = pet_health_expert_fixture()
      assert %Ecto.Changeset{} = PetHealthExpertService.change_pet_health_expert(pet_health_expert)
    end
  end
end
