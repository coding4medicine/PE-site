defmodule C4m.BuyPlanController do
  use C4m.Web, :controller

  alias C4m.BuyPlan

  def index(conn, _params) do
    buyplans = Repo.all(BuyPlan)
    render(conn, "index.html", buyplans: buyplans)
  end

  def new(conn, _params) do
    changeset = BuyPlan.changeset(%BuyPlan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"buy_plan" => buy_plan_params}) do
    changeset = BuyPlan.changeset(%BuyPlan{}, buy_plan_params)

    case Repo.insert(changeset) do
      {:ok, _buy_plan} ->
        conn
        |> put_flash(:info, "Buy plan created successfully.")
        |> redirect(to: buy_plan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    buy_plan = Repo.get!(BuyPlan, id)
    render(conn, "show.html", buy_plan: buy_plan)
  end

  def edit(conn, %{"id" => id}) do
    buy_plan = Repo.get!(BuyPlan, id)
    changeset = BuyPlan.changeset(buy_plan)
    render(conn, "edit.html", buy_plan: buy_plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "buy_plan" => buy_plan_params}) do
    buy_plan = Repo.get!(BuyPlan, id)
    changeset = BuyPlan.changeset(buy_plan, buy_plan_params)

    case Repo.update(changeset) do
      {:ok, buy_plan} ->
        conn
        |> put_flash(:info, "Buy plan updated successfully.")
        |> redirect(to: buy_plan_path(conn, :show, buy_plan))
      {:error, changeset} ->
        render(conn, "edit.html", buy_plan: buy_plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    buy_plan = Repo.get!(BuyPlan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(buy_plan)

    conn
    |> put_flash(:info, "Buy plan deleted successfully.")
    |> redirect(to: buy_plan_path(conn, :index))
  end
end
