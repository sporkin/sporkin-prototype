class UsersController < ApplicationController
  wrap_parameters :include => [:user]

  def create
    puts params
    user = UserService.create(params)
    render :json => user, :status => :created
  end
end
