defmodule C4m.PlanController do
  use C4m.Web, :controller

  alias C4m.Plan

  def index(conn, _params) do
    plans = Repo.all(Plan)
    render(conn, "index.html", plans: plans)
  end

  def new(conn, _params) do
    changeset = Plan.changeset(%Plan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plan" => plan_params}) do
    changeset = Plan.changeset(%Plan{}, plan_params)

    case Repo.insert(changeset) do
      {:ok, _plan} ->
        conn
        |> put_flash(:info, "Plan created successfully.")
        |> redirect(to: plan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan = Repo.get!(Plan, id)
    render(conn, "show.html", plan: plan)
  end

  def edit(conn, %{"id" => id}) do
    plan = Repo.get!(Plan, id)
    changeset = Plan.changeset(plan)
    render(conn, "edit.html", plan: plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan" => plan_params}) do
    plan = Repo.get!(Plan, id)
    changeset = Plan.changeset(plan, plan_params)

    case Repo.update(changeset) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan updated successfully.")
        |> redirect(to: plan_path(conn, :show, plan))
      {:error, changeset} ->
        render(conn, "edit.html", plan: plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan = Repo.get!(Plan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(plan)

    conn
    |> put_flash(:info, "Plan deleted successfully.")
    |> redirect(to: plan_path(conn, :index))
  end
end
