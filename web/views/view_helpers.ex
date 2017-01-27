defmodule Webapp.ViewHelpers do
  def authorized?(conn, action), do: Webapp.Authorization.authorized_link?(conn, action)
end
