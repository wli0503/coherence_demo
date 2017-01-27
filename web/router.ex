defmodule Webapp.Router do
  use Webapp.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end
  
  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Webapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController, only: [:index, :show]
  end

  scope "/", Webapp do
    pipe_through :protected

    resources "/products", ProductController, except: [:index, :show]
  end


  # Other scopes may use custom stacks.
  # scope "/api", Webapp do
  #   pipe_through :api
  # end
end
