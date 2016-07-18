
defmodule Rumbl.UserController do
use Rumbl.Web, :controller
alias Rumbl.User

    def new(conn, _params) do
        IO.inspect "--conn=================---"
        IO.inspect conn
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
    end
    def create(conn, %{"user" => user_params}) do
        IO.inspect "--conn in create=================---"
        IO.inspect conn
        IO.inspect "--user_params in create=================---"
        IO.inspect user_params
        changeset = User.changeset(%User{}, user_params)

        {:ok, user} = Repo.insert(changeset)
        IO.inspect "--changeset=================---"
        IO.inspect changeset

        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
    end

    def index(conn, _params) do
        users = Repo.all(Rumbl.User)
    render conn, "index.html", users: users
    end
    def show(conn, %{"id" => id}) do
        user = Repo.get(Rumbl.User, id)
        render conn, "show.html", user: user
    end

end