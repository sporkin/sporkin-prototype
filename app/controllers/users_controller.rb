class UsersController < ApplicationController
  wrap_parameters :include => [:user]
  def create
    # puts params
    user = UserService.create(params[:user])

    render :json => user, :status => :created
    
    # if user.errors.any?
    # else
    # end
    

  end
end
