defmodule PetClinicWeb.PetHealthExpertController do
  use PetClinicWeb, :controller

  alias PetClinic.PetHealthExpertService
  alias PetClinic.PetHealthExpertService.PetHealthExpert

  def index(conn, _params) do
    pethealthexperts = PetHealthExpertService.list_pethealthexperts()
    render(conn, "index.html", pethealthexperts: pethealthexperts)
  end

  def new(conn, _params) do
    changeset = PetHealthExpertService.change_pet_health_expert(%PetHealthExpert{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pet_health_expert" => pet_health_expert_params}) do
    case PetHealthExpertService.create_pet_health_expert(pet_health_expert_params) do
      {:ok, pet_health_expert} ->
        conn
        |> put_flash(:info, "Pet health expert created successfully.")
        |> redirect(to: Routes.pet_health_expert_path(conn, :show, pet_health_expert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pet_health_expert = PetHealthExpertService.get_pet_health_expert!(id)
    render(conn, "show.html", pet_health_expert: pet_health_expert)
  end

  def edit(conn, %{"id" => id}) do
    pet_health_expert = PetHealthExpertService.get_pet_health_expert!(id)
    changeset = PetHealthExpertService.change_pet_health_expert(pet_health_expert)
    render(conn, "edit.html", pet_health_expert: pet_health_expert, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pet_health_expert" => pet_health_expert_params}) do
    pet_health_expert = PetHealthExpertService.get_pet_health_expert!(id)

    case PetHealthExpertService.update_pet_health_expert(pet_health_expert, pet_health_expert_params) do
      {:ok, pet_health_expert} ->
        conn
        |> put_flash(:info, "Pet health expert updated successfully.")
        |> redirect(to: Routes.pet_health_expert_path(conn, :show, pet_health_expert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pet_health_expert: pet_health_expert, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet_health_expert = PetHealthExpertService.get_pet_health_expert!(id)
    {:ok, _pet_health_expert} = PetHealthExpertService.delete_pet_health_expert(pet_health_expert)

    conn
    |> put_flash(:info, "Pet health expert deleted successfully.")
    |> redirect(to: Routes.pet_health_expert_path(conn, :index))
  end
end
