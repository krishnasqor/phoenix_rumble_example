#ontrollers_views_templates/listings/rumbl/web/views/user_view.ex
defmodule Rumbl.UserView do
    use Rumbl.Web, :view
    alias Rumbl.User
    def first_name(%User{name: name}) do
        name
        |> String.split(" ")
        |> Enum.at(0)
    end
end