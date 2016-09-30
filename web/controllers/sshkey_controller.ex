defmodule C4m.SshkeyController do
  use C4m.Web, :controller

  alias C4m.Sshkey

  def index(conn, _params) do
    sshkeys = Repo.all(Sshkey)
    render(conn, "index.html", sshkeys: sshkeys)
  end

  def new(conn, _params) do
    changeset = Sshkey.changeset(%Sshkey{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sshkey" => sshkey_params}) do
    changeset = Sshkey.changeset(%Sshkey{}, sshkey_params)

    case Repo.insert(changeset) do
      {:ok, _sshkey} ->
        conn
        |> put_flash(:info, "Sshkey created successfully.")
        |> redirect(to: sshkey_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sshkey = Repo.get!(Sshkey, id)
    render(conn, "show.html", sshkey: sshkey)
  end

  def edit(conn, %{"id" => id}) do
    sshkey = Repo.get!(Sshkey, id)
    changeset = Sshkey.changeset(sshkey)
    render(conn, "edit.html", sshkey: sshkey, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sshkey" => sshkey_params}) do
    sshkey = Repo.get!(Sshkey, id)
    changeset = Sshkey.changeset(sshkey, sshkey_params)

    case Repo.update(changeset) do
      {:ok, sshkey} ->
        conn
        |> put_flash(:info, "Sshkey updated successfully.")
        |> redirect(to: sshkey_path(conn, :show, sshkey))
      {:error, changeset} ->
        render(conn, "edit.html", sshkey: sshkey, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sshkey = Repo.get!(Sshkey, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sshkey)

    conn
    |> put_flash(:info, "Sshkey deleted successfully.")
    |> redirect(to: sshkey_path(conn, :index))
  end
end
