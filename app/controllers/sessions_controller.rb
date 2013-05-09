class SessionsController < ApplicationController
  def create
    auth = UserService.authenticate(params)
    if auth.invalid?
      render :json => auth, :status => :unprocessible_entitiy
    else
      session[:id] = auth.auth_key
      render :json => auth, :status => :ok
    end
  end
end
