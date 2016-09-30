defmodule C4m.BuyBookController do
  use C4m.Web, :controller

  alias C4m.BuyBook

  def index(conn, _params) do
    buybooks = Repo.all(BuyBook)
    render(conn, "index.html", buybooks: buybooks)
  end

  def new(conn, _params) do
    changeset = BuyBook.changeset(%BuyBook{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"buy_book" => buy_book_params}) do
    changeset = BuyBook.changeset(%BuyBook{}, buy_book_params)

    case Repo.insert(changeset) do
      {:ok, _buy_book} ->
        conn
        |> put_flash(:info, "Buy book created successfully.")
        |> redirect(to: buy_book_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    buy_book = Repo.get!(BuyBook, id)
    render(conn, "show.html", buy_book: buy_book)
  end

  def edit(conn, %{"id" => id}) do
    buy_book = Repo.get!(BuyBook, id)
    changeset = BuyBook.changeset(buy_book)
    render(conn, "edit.html", buy_book: buy_book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "buy_book" => buy_book_params}) do
    buy_book = Repo.get!(BuyBook, id)
    changeset = BuyBook.changeset(buy_book, buy_book_params)

    case Repo.update(changeset) do
      {:ok, buy_book} ->
        conn
        |> put_flash(:info, "Buy book updated successfully.")
        |> redirect(to: buy_book_path(conn, :show, buy_book))
      {:error, changeset} ->
        render(conn, "edit.html", buy_book: buy_book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    buy_book = Repo.get!(BuyBook, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(buy_book)

    conn
    |> put_flash(:info, "Buy book deleted successfully.")
    |> redirect(to: buy_book_path(conn, :index))
  end
end
